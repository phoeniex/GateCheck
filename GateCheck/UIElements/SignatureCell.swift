//
//  SignatureCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 5/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material

struct SignatureCellModel: ImageExpanableCellModel {
  var type: RowType
  var identifier: String
  var title: String
  var placeHolder: String
  var approver: String
  var isImagePanelHidden: Bool
  var imageUrls: [String]
  
  init() {
    type = .signature
    identifier = "SignatureCell"
    title = ""
    placeHolder = ""
    approver = ""
    isImagePanelHidden = true
    imageUrls = []
  }
}

class SignatureCell: ImageExpanableCell {
  
  @IBOutlet weak var approverTextField: TextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    standardHeight = 94
    height = 94
    
    approverTextField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    approverTextField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    approverTextField.placeholderLabel.fontSize = 12
    approverTextField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    toggleImagePanelButton.setImage(#imageLiteral(resourceName: "icon_signature"), for: .normal)
    toggleImagePanelButton.setImage(#imageLiteral(resourceName: "icon_dismiss_collection"), for: .selected)
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? SignatureCellModel else { return }
    
    titleLabel.text = cellModel.title
    approverTextField.text = cellModel.approver
    approverTextField.text = cellModel.placeHolder
    urlImages = cellModel.imageUrls
    displayImages()
  }
  
}
