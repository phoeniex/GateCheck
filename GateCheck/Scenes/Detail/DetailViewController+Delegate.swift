//
//  DetailViewController+Delegate.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 19/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit
import DKImagePickerController
import Lightbox

extension DetailViewController: DetailCellDelegate {
  
  func willAddImage(_ cell: DetailCell) {
    guard let imageExpanableCell = cell as? ImageExpanableCell else { return }
    let imagePicker = DKImagePickerController()
    imagePicker.didSelectAssets = { [weak self] (assets) in
      self?.updateImageFor(imageExpanableCell, assets: assets)
    }
    
    imagePicker.providesPresentationContextTransitionStyle = true
    imagePicker.definesPresentationContext = true
    imagePicker.showsCancelButton = true
    imagePicker.allowsLandscape = true
    imagePicker.assetType = .allPhotos
    imagePicker.modalPresentationStyle = .formSheet
    
    imagePicker.setSelectedAssets(assets: imageExpanableCell.localImages)
    present(imagePicker, animated: true, completion: nil)
  }
  
  func willOpenImage(_ cell: DetailCell, image: Any) {
    var lightboxImage: [LightboxImage] = []
    if let imageString = image as? String {
      let urlString = GateCheckApiWorker().getImageUrl(imageString)
      lightboxImage.append(LightboxImage(imageURL: URL(string: urlString)!))
    }
    
    LightboxConfig.DeleteButton.enabled = true
    LightboxConfig.PageIndicator.enabled = false
    let controller = LightboxController(images: lightboxImage)
    controller.dynamicBackground = true
    controller.dismissalDelegate = self
    
    present(controller, animated: true, completion: nil)
  }
  
  func didToggleImagePanel(_ cell: DetailCell, isHidden: Bool) {
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    
    guard var cellModel = detailCells[indexPath.row] as? ImageExpanableCellModel else { return }
    cellModel.isImagePanelHidden = isHidden
    detailCells[indexPath.row] = cellModel
    
    tableView.reloadRows(at: [indexPath], with: .none)
  }
  
  func didToggleAdditionalPanel(_ cell: DetailCell, isHidden: Bool) {
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    
    guard var cellModel = detailCells[indexPath.row] as? MultipleChoicesQuestionCellModel else { return }
    cellModel.isAdditionalPanelHidden = isHidden
    detailCells[indexPath.row] = cellModel
    
    tableView.reloadRows(at: [indexPath], with: .none)
  }
  
  func didValueChanged(_ cell: DetailCell) {
    
  }
  
}

extension DetailViewController: LightboxControllerDismissalDelegate {
  
  func lightboxControllerWillDismiss(_ controller: LightboxController){
    print(controller.images)
  }
  
}
