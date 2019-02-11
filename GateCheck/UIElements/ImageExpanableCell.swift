//
//  ImageExpanableCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 7/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import DKImagePickerController

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
  var imageListExpandedHeight: CGFloat = 108
  
  var imageDisplayItems: [Any] {
    var listOfImages: [Any] = [#imageLiteral(resourceName: "icon_add_image")]
    listOfImages.append(contentsOf: urlImages)
    listOfImages.append(contentsOf: localImages)
    return listOfImages
  }
  
  var localImages: [DKAsset] = []
  var urlImages: [String] = []
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    toggleImagePanelButton.layer.borderColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    toggleImagePanelButton.layer.borderWidth = 1
    toggleImagePanelButton.layoutSubviews()
    toggleImagePanelButton.setImage(#imageLiteral(resourceName: "icon_photo"), for: .normal)
    toggleImagePanelButton.setImage(#imageLiteral(resourceName: "icon_dismiss_collection"), for: .selected)
    imagePanelView.isHidden = true
    setupCollectionView()
  }
  
  @IBAction func tapOnToggleImagePanel(sender: UIButton!) {
    setImagePanelHidden(imagePanelView.isHidden == false, animated: true)
  }
  
  func setImagePanelHidden(_ isHidden: Bool, animated: Bool) {
    let imageListHeight = isHidden ? 0 : imageListExpandedHeight
    let expendedHeight = standardHeight + imageListHeight
    
    height = expendedHeight
    toggleImagePanelButton.isSelected = isHidden == false
    imagePanelView.isHidden = isHidden
    delegate?.didToggleImagePanel(self, isHidden: isHidden)
  }
  
  func displayImages() {
    let imageCount = urlImages.count + localImages.count
    imageBadgeLabel.text = imageCount > 9 ? "9+" : "\(imageCount)"
    imageBadgeLabel.isHidden = imageCount == 0
    imageCollectionView.reloadData()
  }
  
}
