//
//  DetailViewController+Delegate.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import DKImagePickerController

extension DetailViewController: DetailCellDelegate {
  
  func willAddImage(_ cell: DetailCell) {
    let imagePicker = DKImagePickerController()
    imagePicker.didSelectAssets = { [weak self] (assets) in
      self?.updateImageFor(id: 123, assets)
    }
    
    imagePicker.providesPresentationContextTransitionStyle = true
    imagePicker.definesPresentationContext = true
    imagePicker.modalPresentationStyle = .formSheet
    present(imagePicker, animated: true, completion: nil)
  }
  
  func willOpenImage(_ cell: DetailCell, image: UIImage) {
    
  }
  
  func didToggleImagePanel(_ cell: DetailCell, isHidden: Bool) {
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    
    guard var cellModel = detailCells[indexPath.row] as? ImageExpanableCellModel else { return }
    cellModel.isImagePanelHidden = isHidden
    detailCells[indexPath.row] = cellModel
    
    tableView.beginUpdates()
    tableView.endUpdates()
    print("Update Row \(indexPath.row) to \(isHidden)")
  }
  
  func didToggleAdditionalPanel(_ cell: DetailCell, isHidden: Bool) {
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    
    guard var cellModel = detailCells[indexPath.row] as? MultipleChoicesQuestionCellModel else { return }
    cellModel.isAdditionalPanelHidden = isHidden
    detailCells[indexPath.row] = cellModel
    
    tableView.beginUpdates()
    tableView.endUpdates()
    print("Update Note Row \(indexPath.row) to \(isHidden)")
  }
  
  func didValueChanged(_ cell: DetailCell) {
    
  }
  
}
