//
//  ImageCollectionView.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

class imageCollectionView: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    imageView.image = #imageLiteral(resourceName: "icon_add_image")
  }
  
}
