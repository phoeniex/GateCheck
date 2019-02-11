//
//  String+Unicode.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 27/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import Foundation

extension String {
  
  var formattedUnicode: String {
    do {
      let regex = try NSRegularExpression(pattern: "(\\\\u)([0-9a-f]{4})")
      let range = NSMakeRange(0, count)
      var outputString = self
      regex.matches(in: self, options: [], range: range).forEach { (matchedRange) in
        let string = self as NSString
        let matchedString = string.substring(with: matchedRange.range)
        let unicode = matchedString.replacingOccurrences(of: "\\u", with: "")
        guard let unicodeScalar = UnicodeScalar(Int(unicode, radix: 16) ?? 0) else { return }
        outputString = outputString.replacingOccurrences(of: matchedString, with: String(unicodeScalar))
      }
      return outputString
    } catch {
      return self
    }
  }
  
  var trimmingGarbageCharacters: String {
    let lastBracketIndex = lastIndex(of: "}") ?? endIndex
    return String(prefix(through: lastBracketIndex))
  }
  
}
