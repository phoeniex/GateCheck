//
//  LoginRouter.swift
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

@objc protocol LoginRoutingLogic {
  func navigateToMain()
}

protocol LoginDataPassing {
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
  
  // MARK: - Route Functions
  
  // MARK: - Navigate Functions
  func navigateToMain() {
    viewController?.performSegue(withIdentifier: "Main", sender: nil)
  }
  
  // MARK: - Passing Data Functions
  
}