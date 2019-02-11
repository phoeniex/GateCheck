//
//  ChoicesQuestionView.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material
import Kingfisher

struct MultipleChoicesQuestionCellModel: ImageExpanableCellModel {
  var type: RowType
  var identifier: String
  var question: String
  var choices: [String]
  var choiceSelected: Int?
  var approvalChoices: [String]
  var approvalSelected: Int?
  var note: String
  var approver: String
  var isImagePanelHidden: Bool
  var isAdditionalPanelHidden: Bool
  var imageUrls: [String]
  
  init() {
    type = .multipleChoiceQuestion
    identifier = "MultipleChoicesQuestionCell"
    question = ""
    choices = []
    approvalChoices = []
    note = ""
    approver = ""
    isImagePanelHidden = true
    isAdditionalPanelHidden = true
    imageUrls = []
  }
}

class MultipleChoicesQuestionCell: ImageExpanableCell {
  
  @IBOutlet weak var noteTextField: TextField!
  @IBOutlet weak var usernameTextField: TextField!
  @IBOutlet weak var additionalFieldView: UIView!
  @IBOutlet weak var choiceSegmentControl: UISegmentedControl!
  @IBOutlet weak var approvalSegmentControl: UISegmentedControl!
  
  var additionalFormExpandedHeight: CGFloat = 0
  
  var note: String {
    get { return noteTextField.text ?? "" }
    set { noteTextField.text = newValue }
  }
  
  var userName: String {
    get { return usernameTextField.text ?? "" }
    set { usernameTextField.text = newValue }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    standardHeight = 74
    additionalFormExpandedHeight = 38
    height = 74
    
    noteTextField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    noteTextField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    noteTextField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    usernameTextField.dividerActiveColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    usernameTextField.dividerNormalColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.5647058824, alpha: 1)
    usernameTextField.placeholderActiveColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    setAdditionalFieldHidden(true)
  }
  
  @IBAction func tapOnChoice(sender: UISegmentedControl!) {
    if sender.selectedSegmentIndex == sender.numberOfSegments - 1 {
      setAdditionalFieldHidden(false)
    } else {
      setAdditionalFieldHidden(true)
    }
  }
  
  func setAdditionalFieldHidden(_ isHidden: Bool) {
    additionalFieldView.isHidden = isHidden
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? MultipleChoicesQuestionCellModel else { return }
    
    titleLabel.text = cellModel.question
    noteTextField.text = cellModel.note
    usernameTextField.text = cellModel.approver
    
    displayRadioBox(choiceSegmentControl, choices: cellModel.choices)
    choiceSegmentControl.selectedSegmentIndex = cellModel.choiceSelected ?? UISegmentedControl.noSegment
    
    displayRadioBox(approvalSegmentControl, choices: cellModel.approvalChoices)
    approvalSegmentControl.selectedSegmentIndex = cellModel.approvalSelected ?? UISegmentedControl.noSegment
    
    urlImages = cellModel.imageUrls
    displayImages()
  }
  
  func displayRadioBox(_ radioBox: UISegmentedControl, choices: [String]) {
    radioBox.removeAllSegments()
    choices.reversed().forEach {
      radioBox.insertSegment(withTitle: $0, at: 0, animated: false)
    }
  }
  
}
