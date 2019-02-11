//
//  Data+HTML.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 27/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import Foundation

extension Data {
  var toHtmlString: String {
    do {
      let attributedString = try NSAttributedString(data: self,
                                                    options: [.documentType: NSAttributedString.DocumentType.html,
                                                              .characterEncoding: String.Encoding.utf8.rawValue],
                                                    documentAttributes: nil)
      return attributedString.string
    } catch {
      return ""
    }
  }
}
