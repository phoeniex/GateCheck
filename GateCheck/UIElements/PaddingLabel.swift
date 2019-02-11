//
//  PaddingLabel.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 12/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import UIKit

@IBDesignable public class PaddingLabel: UILabel {
  
  @IBInspectable public var topInset: CGFloat = 4.0
  @IBInspectable public var bottomInset: CGFloat = 4.0
  @IBInspectable public var leftInset: CGFloat = 4.0
  @IBInspectable public var rightInset: CGFloat = 4.0
  
  override public func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }
  
  override public var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset,
                  height: size.height + topInset + bottomInset)
  }
}
