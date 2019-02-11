//
//  MainViewController+SplitView.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 12/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

extension MainViewController {
  
  func setupSplitView() {
    splitViewController?.delegate = self
    splitViewController?.preferredDisplayMode = .allVisible
    
    addDisplayModeButton()
  }
  
  func addDisplayModeButton() {
    if let navigationController = splitViewController?.viewControllers.last as? UINavigationController {
      navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    }
  }
  
}

extension MainViewController: UISplitViewControllerDelegate {
  
  func splitViewController(_ splitViewController: UISplitViewController,
                           collapseSecondary secondaryViewController: UIViewController,
                           onto primaryViewController: UIViewController) -> Bool {
    return collapseDetailViewController
  }
  
  
}
