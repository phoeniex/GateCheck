//
//  ImageExpanableCell+Collection.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Kingfisher
import DKImagePickerController

extension ImageExpanableCell {
  
  func setupCollectionView() {
    imageCollectionView.dataSource = self
    imageCollectionView.delegate = self
    imageCollectionView.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
  }
  
}

extension ImageExpanableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageDisplayItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? imageCollectionView
    else {
      return UICollectionViewCell()
    }
    
    cell.imageView.kf.indicatorType = .activity
    cell.imageView.layer.cornerRadius = 4
    cell.imageView.clipsToBounds = true
    if let placeHolderImage = imageDisplayItems[indexPath.row] as? UIImage {
      cell.imageView.image = placeHolderImage
    } else if let urlImageString = imageDisplayItems[indexPath.row] as? String {
      let url = GateCheckApiWorker().getImageUrl(urlImageString)
      cell.imageView.kf.setImage(with: URL(string: url), options: [.processor(RoundCornerImageProcessor(cornerRadius: 4))])
    } else if let localAsset = imageDisplayItems[indexPath.row] as? DKAsset {
      let size = cell.imageView.bounds.size
      cell.imageView.kf.setImage(with: DKImageProvider(asset: localAsset, size: size), options: [.processor(RoundCornerImageProcessor(cornerRadius: 4))])
    }
    
    return cell
  }
  
}

extension ImageExpanableCell: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      delegate?.willAddImage(self)
    } else {
      delegate?.willOpenImage(self, image: imageDisplayItems[indexPath.row])
    }
  }
  
}
