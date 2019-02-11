//
//  DetailViewController+Table.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 27/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

extension DetailViewController {
  
  func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "TitleCell", bundle: nil),
                       forCellReuseIdentifier: "TitleCell")
    tableView.register(UINib(nibName: "TextFormCell", bundle: nil),
                       forCellReuseIdentifier: "TextFormCell")
    tableView.register(UINib(nibName: "DateFormCell", bundle: nil),
                       forCellReuseIdentifier: "DateFormCell")
    tableView.register(UINib(nibName: "SignatureCell", bundle: nil),
                       forCellReuseIdentifier: "SignatureCell")
    tableView.register(UINib(nibName: "RadioBoxWithTextCell", bundle: nil),
                       forCellReuseIdentifier: "RadioBoxWithTextCell")
    tableView.register(UINib(nibName: "CheckBoxWithTextCell", bundle: nil),
                       forCellReuseIdentifier: "CheckBoxWithTextCell")
    tableView.register(UINib(nibName: "MultipleChoicesQuestionCell", bundle: nil),
                       forCellReuseIdentifier: "MultipleChoicesQuestionCell")
  }
  
}

extension DetailViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return detailCells.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let detailCell = detailCells[indexPath.row]
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: detailCell.identifier,
                                               for: indexPath) as? DetailCell
    else {
      return UITableViewCell()
    }
    
    cell.displayCell(detailCell)
    cell.delegate = self
    
    if let imageExpanableCell = cell as? ImageExpanableCell,
      let cellModel = detailCell as? ImageExpanableCellModel {
      print("Set Hidden From Cell For Row: \(cellModel.isImagePanelHidden)")
      imageExpanableCell.setImagePanelHidden(cellModel.isImagePanelHidden, animated: false)
    }
    
    if let multipleChoiceCell = cell as? MultipleChoicesQuestionCell,
      let cellModel = detailCell as? MultipleChoicesQuestionCellModel {
      print("Set Note Hidden From Cell For Row: \(cellModel.isImagePanelHidden)")
      multipleChoiceCell.setAdditionalFieldHidden(cellModel.isAdditionalPanelHidden)
    }
    
    return cell
  }
  
}

extension DetailViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    guard let cell = tableView.cellForRow(at: indexPath) as? DetailCell
    else {
      return tableView.estimatedRowHeight
    }
    
    return cell.height
  }
  
}
