//
//  TitleCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 5/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

struct TitleCellModel: DetailCellModel {
  var type: RowType
  var identifier: String
  var title: String
  
  init() {
    type = .text
    identifier = "TitleCell"
    title = ""
  }
}

class TitleCell: DetailCell {

  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    height = 36
  }
  
  override func displayCell(_ cellModel: DetailCellModel) {
    guard let cellModel = cellModel as? TitleCellModel else { return }
    titleLabel.text = cellModel.title
  }

}
