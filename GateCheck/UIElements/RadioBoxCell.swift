//
//  RadioBoxCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 7/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material

struct RadioBoxWithTextCellModel: DetailCellModel {
  var rowId: String
  var type: RowType
  var identifier: String
  var title: String
  var text: String
  var placeHolder: String
  var choices: [String]
  var choiceSelected: Int?
  
  init() {
    rowId = ""
    type = .radioBoxWithText
    identifier = "RadioBoxWithTextCell"
    title = ""
    text = ""
    choices = []
    placeHolder = ""
  }
}

class RadioBoxWithTextCell: DetailCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var textField: TextField!
  @IBOutlet weak var radioBoxSegmentedControl: UISegmentedControl!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    height = 60
    
    textField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    textField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    textField.placeholderLabel.fontSize = 12
    textField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? RadioBoxWithTextCellModel else { return }
    rowId = cellModel.rowId
    titleLabel.text = cellModel.title
    textField.text = cellModel.text
    textField.placeholder = cellModel.placeHolder
    
    displayRadioBox(cellModel.choices)
    radioBoxSegmentedControl.selectedSegmentIndex = cellModel.choiceSelected ?? UISegmentedControl.noSegment
  }
  
  func displayRadioBox(_ choices: [String]) {
    radioBoxSegmentedControl.removeAllSegments()
    choices.reversed().forEach {
      radioBoxSegmentedControl.insertSegment(withTitle: $0, at: 0, animated: false)
    }
  }
  
}
