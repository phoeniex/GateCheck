//
//  DateFormCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 5/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material

struct DateFormCellModel: DetailCellModel {
  var rowId: String
  var type: RowType
  var identifier: String
  var dateString: String
  var placeHolder: String
  
  init() {
    rowId = ""
    type = .dateTime
    identifier = "DateFormCell"
    dateString = ""
    placeHolder = ""
  }
}

class DateFormCell: DetailCell {
  
  @IBOutlet weak var dateTextField: TextField!
  @IBOutlet weak var iconImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    height = 54
    iconImageView.image = #imageLiteral(resourceName: "icon_date")
    
    dateTextField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    dateTextField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    dateTextField.placeholderLabel.fontSize = 12
    dateTextField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? DateFormCellModel else { return }
    rowId = cellModel.rowId
    dateTextField.text = cellModel.dateString
    dateTextField.placeholder = cellModel.placeHolder
  }
  
}
