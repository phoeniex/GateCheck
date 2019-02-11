//
//  DetailModels.swift
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
import DKImagePickerController
import Result

enum Detail {
  
  struct CheckConfirmationNeed {
    struct Request { }
    struct Response {
      var isNeedConfirmation: Bool
    }
    
    struct ViewModel {
      struct Error {
        var title: String
        var message: String
        var saveButton: String
        var discardButton: String
      }
      
      var error: ViewModel.Error?
    }
  }
  
  struct FetchCheckListDetail {
    struct Request { }
    struct Response {
      var result: Result<[CheckListDetail], APIError>?
      var id: String?
    }
    
    struct ViewModel {
      struct Error: ErrorAlertInterface {
        var title: String
        var message: String
        var button: String
      }
      
      var result: Result<[DetailCellModel], ViewModel.Error>?
      var id: String?
    }
  }
  
  struct UpdatedImageAsset {
    struct Request {
      var id: Int
      var assets: [DKAsset]
    }
    
    struct Response {
      var id: Int
      var images: [UIImage]
    }
    
    struct ViewModel {
      var id: Int
      var images: [UIImage]
    }
  }
  
}