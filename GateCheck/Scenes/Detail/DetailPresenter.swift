//
//  DetailPresenter.swift
//  Gate Check
//
//  Created by Rawipon Srivibha on 17/12/18.
//  Copyright (c) 2018 Allianz Technology. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Result

protocol DetailPresentationLogic {
  func presentConfirmation(_ response: Detail.CheckConfirmationNeed.Response)
  func presentCheckListDetail(_ response: Detail.FetchCheckListDetail.Response)
  func presentImages(_ response: Detail.UpdatedImageAsset.Response)
}

class DetailPresenter: DetailPresentationLogic {
  weak var viewController: DetailDisplayLogic?
  
  lazy var checkListRowWorker = CheckListRowWorker()

  // MARK: - Presentation Function
  func presentConfirmation(_ response: Detail.CheckConfirmationNeed.Response) {
    var error: Detail.CheckConfirmationNeed.ViewModel.Error? = nil
    if response.isNeedConfirmation {
      error = Detail.CheckConfirmationNeed.ViewModel.Error(title: "Save Confirmation",
                                                           message: "There is some information changed in current id, Do you want to save it?",
                                                           saveButton: "Save",
                                                           discardButton: "Discard")
    }
    let viewModel = Detail.CheckConfirmationNeed.ViewModel(error: error)
    viewController?.displayConfirmationDialog(viewModel)
  }
  
  func presentCheckListDetail(_ response: Detail.FetchCheckListDetail.Response) {
    guard let responseResult = response.result else {
      let viewModel = Detail.FetchCheckListDetail.ViewModel(result: nil, id: response.id)
      viewController?.displayCheckListDetail(viewModel)
      return
    }
    
    let result: Result<[DetailCellModel], Detail.FetchCheckListDetail.ViewModel.Error>!
    switch responseResult {
    case .success(let checkListRows):
      result = .success(getCheckListDisplayObject(checkListRows))
    case .failure(let error):
      result = .failure(getErrorApiDisplayObject(error))
    }
    
    let viewModel = Detail.FetchCheckListDetail.ViewModel(result: result, id: response.id)
    viewController?.displayCheckListDetail(viewModel)
  }
  
  func getCheckListDisplayObject(_ checkListRows: [CheckListDetail]) -> [DetailCellModel] {
    return checkListRowWorker.toDetailRow(checkListRows)
  }
  
  func getErrorApiDisplayObject(_ error: APIError) -> Detail.FetchCheckListDetail.ViewModel.Error {
    let errorAlert = Detail.FetchCheckListDetail.ViewModel.Error(title: "Error",
                                                                 message: "Cannot Connect To Service. Please Try Again.",
                                                                 button: "Okay")
    return errorAlert
  }
  
  func presentImages(_ response: Detail.UpdatedImageAsset.Response) {
    viewController?.displayImages(Detail.UpdatedImageAsset.ViewModel(id: response.id, images: response.images))
  }
  
}
