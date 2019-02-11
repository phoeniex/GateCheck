//
//  ImageExpanableCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 7/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

protocol ImageExpanableCellModel: DetailCellModel {
  var isImagePanelHidden: Bool { get set }
  var imageUrls: [String] { get set }
}

class ImageExpanableCell: DetailCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var toggleImagePanelButton: UIButton!
  @IBOutlet weak var imageBadgeLabel: UILabel!
  @IBOutlet weak var imagePanelView: UIView!
  @IBOutlet weak var imageCollectionView: UICollectionView!
  
  var standardHeight: CGFloat = 0
  var imageListExpandedHeight: CGFloat = 100
  
  var imageDisplayItems: [UIImage] = []
  
  var images: [UIImage] {
    get { return imageDisplayItems.slice(start: 1, end: nil) }
    set { displayImages(newValue) }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    toggleImagePanelButton.layer.borderColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    toggleImagePanelButton.layer.borderWidth = 1
    toggleImagePanelButton.layoutSubviews()
    imagePanelView.isHidden = true
    setupCollectionView()
  }
  
  @IBAction func tapOnToggleImagePanel(sender: UIButton!) {
    setImagePanelHidden(imagePanelView.isHidden == false, animated: true)
  }
  
  func setImagePanelHidden(_ isHidden: Bool, animated: Bool) {
    let imageListHeight = isHidden ? 0 : imageListExpandedHeight
    let expendedHeight = standardHeight + imageListHeight
  
    imagePanelView.isHidden = isHidden
    height = expendedHeight
    delegate?.didToggleImagePanel(self, isHidden: isHidden)
  }
  
  func displayImages(_ images: [UIImage]) {
    imageDisplayItems = images
    imageDisplayItems.insert(#imageLiteral(resourceName: "icon_add_image"), at: 0)
    imageCollectionView.reloadData()
  }
  
}
