//
//  UIAlertView+Ruler.swift
//  Gate Check
//
//  Created by Rawipon Srivibha on 17/12/18.
//  Copyright © 2018 Allianz. All rights reserved.
//

import UIKit

protocol ErrorAlertInterface: Error {
  var title: String { get set }
  var message: String { get set }
  var button: String { get set }
}

extension UIAlertController {
  
  convenience init(userInfo: [String: String]) {
    self.init(title: userInfo["title"], message: userInfo["message"], preferredStyle: .alert)
    addAction(UIAlertAction(title: userInfo["button"], style: .default, handler: nil))
  }
  
  convenience init(errorAlert: ErrorAlertInterface) {
    self.init(title: errorAlert.title, message: errorAlert.message, preferredStyle: .alert)
    addAction(UIAlertAction(title: errorAlert.button, style: .default, handler: nil))
  }
  
}
