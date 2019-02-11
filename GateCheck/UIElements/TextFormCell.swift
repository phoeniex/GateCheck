//
//  TextFormCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 5/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material

struct TextFormCellModel: DetailCellModel {
  var type: RowType
  var identifier: String
  var text: String
  var placeHolder: String
  
  init() {
    type = .text
    identifier = "TextFormCell"
    text = ""
    placeHolder = ""
  }
}

class TextFormCell: DetailCell {
  
  @IBOutlet weak var textField: TextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    height = 54
    
    textField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    textField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    textField.placeholderLabel.fontSize = 12
    textField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? TextFormCellModel else { return }
    
    textField.text = cellModel.text
    textField.placeholder = cellModel.placeHolder
  }
  
}
