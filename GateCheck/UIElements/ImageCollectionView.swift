//
//  ImageCollectionView.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

protocol ImageCollectionViewDelegate: class {
  func willDeleteImage(cell: ImageCollectionView)
}

class ImageCollectionView: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  
  weak var delegate: ImageCollectionViewDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  @IBAction func tapOnDelete(_ sender: UIButton) {
    let alert = UIAlertController(title: "Delete", message: "Delete?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
      guard let strongSelf = self else { return }
      strongSelf.delegate?.willDeleteImage(cell: strongSelf)
    })
    
    parentContainerViewController()?.present(alert, animated: true, completion: nil)
    
  }
  
}
