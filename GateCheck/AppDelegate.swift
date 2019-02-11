//
//  AppDelegate.swift
//  Gate Check
//
//  Created by Rawipon Srivibha on 17/12/18.
//  Copyright © 2018 Allianz. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    IQKeyboardManager.shared.enable = true
    SVProgressHUD.setDefaultMaskType(.clear)
    
    return true
  }

}

