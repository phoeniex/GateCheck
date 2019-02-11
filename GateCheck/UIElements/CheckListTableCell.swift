//
//  CheckListTableCell.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 12/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

struct CheckListModel {
  var identifier: String
  var idName: String
  var groupName: String
  var licensePlate: String
  var status: CheckListStatus
  var version: String
  var createdDateString: String
  var lastModifiedDateString: String
}

class CheckListTableCell: UITableViewCell {
  
  @IBOutlet weak var checkIconImageView: UIImageView!
  @IBOutlet weak var checkView: UIView!
  @IBOutlet weak var versionLabel: UILabel!
  @IBOutlet weak var createdDateLabel: UILabel!
  @IBOutlet weak var lastModifiedDateLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var groupLabel: UILabel!
  @IBOutlet weak var licensePlateLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    licensePlateLabel.layer.borderColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    licensePlateLabel.layer.borderWidth = 1
    licensePlateLabel.layoutSubviews()
  }
  
  func display(_ model: CheckListModel) {
    versionLabel.text = model.version
    createdDateLabel.text = model.createdDateString
    lastModifiedDateLabel.text = model.lastModifiedDateString
    idLabel.text = model.idName
    groupLabel.text = model.groupName
    licensePlateLabel.text = model.licensePlate
    
    displayCheckListStatus(model.status)
  }
  
  func displayCheckListStatus(_ status: CheckListStatus) {
    checkIconImageView.image = status == .checkIn ? #imageLiteral(resourceName: "icon_check_in") : #imageLiteral(resourceName: "icon_check_out")
    checkView.backgroundColor =  status == .checkIn ? #colorLiteral(red: 0.1921568627, green: 0.5803921569, blue: 0.4156862745, alpha: 1) : #colorLiteral(red: 0, green: 0.5568627451, blue: 0.7764705882, alpha: 1)
  }
  
}
