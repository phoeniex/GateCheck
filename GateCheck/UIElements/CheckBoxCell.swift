//
//  CheckBoxCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 7/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material

struct CheckBoxWithTextCellModel: DetailCellModel {
  var type: RowType
  var identifier: String
  var text: String
  var placeHolder: String
  var isSelected: Bool
  
  init() {
    type = .checkBoxWithText
    identifier = "CheckBoxWithTextCell"
    text = ""
    placeHolder = ""
    isSelected = false
  }
}

class CheckBoxWithTextCell: DetailCell {
  
  @IBOutlet weak var textField: TextField!
  @IBOutlet weak var checkButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    height = 54
    
    textField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    textField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    textField.placeholderLabel.fontSize = 12
    textField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    checkButton.setImage(#imageLiteral(resourceName: "icon_checkbox_normal"), for: .normal)
    checkButton.setImage(#imageLiteral(resourceName: "icon_checkbox_selected"), for: .selected)
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? CheckBoxWithTextCellModel else { return }
    
    textField.text = cellModel.text
    textField.placeholder = cellModel.placeHolder
    
    checkButton.isSelected = cellModel.isSelected
  }
  
  @IBAction func tapOnCheckBox(sender: UIButton) {
    sender.isSelected.toggle()
    delegate?.didValueChanged(self)
  }
  
}
