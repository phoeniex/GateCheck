//
//  ImageExpanableCell+Collection.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

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
    
    cell.imageView.image = imageDisplayItems[indexPath.row]
    return cell
  }
  
}

extension ImageExpanableCell: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      delegate?.willAddImage(self)
    } else {
      delegate?.willOpenImage(self, image: images[indexPath.row])
    }
  }
  
}
