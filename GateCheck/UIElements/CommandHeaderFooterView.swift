//
//  CommandHeaderFooterView.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 12/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import Material

protocol CommandHeaderFooterViewDelegate: class {
  func tapOnAddButton()
  func tapOnFilterButton()
}

class CommandHeaderFooterView: UITableViewHeaderFooterView {
  
  weak var delegate: CommandHeaderFooterViewDelegate?
  
  @IBAction func tapOnAddButton(_ sender: UIButton) {
    delegate?.tapOnAddButton()
  }
  
  @IBAction func tapOnFilterButton(_ sender: UIButton) {
    delegate?.tapOnFilterButton()
  }
  
}
