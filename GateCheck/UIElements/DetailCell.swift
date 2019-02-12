//
//  DetailCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 27/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

enum RowType {
  case title
  case text
  case dateTime
  case signature
  case radioBoxWithText
  case checkBoxWithText
  case vehicleDetail
  case multipleChoiceQuestion
}

protocol DetailCellDelegate: class {
  func willAddImage(_ cell: DetailCell)
  func willOpenImage(_ cell: DetailCell, image: Any)
  func didToggleImagePanel(_ cell: DetailCell, isHidden: Bool)
  func didToggleAdditionalPanel(_ cell: DetailCell, isHidden: Bool)
  func didValueChanged(_ cell: DetailCell)
}

protocol DetailCellModel {
  var rowId: String { get set }
  var type: RowType { get set }
  var identifier: String { get set }
}

class DetailCell: UITableViewCell {
  
  var rowId = ""
  var height: CGFloat = 0
  weak var delegate: DetailCellDelegate?
  
  func displayCell(_ cellModel: DetailCellModel) { }

}
