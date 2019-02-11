//
//  MainViewController+Table.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 12/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

extension MainViewController {
  
  func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    refreshControl?.addTarget(self, action: #selector(refreshingStart), for: .valueChanged)
    tableView.register(UINib(nibName: "CommandHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Command")
  }
  
}

extension MainViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return checkLists.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListCell", for: indexPath) as? CheckListTableCell else {
      return UITableViewCell()
    }
    
    let checkList = checkLists[indexPath.row]
    cell.display(checkList)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Command") as? CommandHeaderFooterView else {
      return UIView()
    }
    
    view.delegate = self
    return view
  }
  
}

extension MainViewController {
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    selectedCheckList(row: indexPath.row)
  }
  
}

extension MainViewController: CommandHeaderFooterViewDelegate {
  
  func tapOnFilterButton() {
    print("FILTER")
  }
  
  func tapOnAddButton() {
    print("ADD")
  }
  
}
