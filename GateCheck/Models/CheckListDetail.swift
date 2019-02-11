//
//  CheckListDetail.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 5/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import Foundation

struct CheckListDetailResponse: Codable {
  
  enum CodingKeys: String, CodingKey {
    case rows = "DATA"
  }
  
  var rows: [CheckListDetail]
  
  init() {
    rows = []
  }
  
}

enum DataType: String {
  case hidden = "H"
  case text = "T"
  case dateTime = "D"
  case checkBox = "C"
  case radioBox = "R"
  case signature = "Z"
}

struct CheckListDetail: Codable {
  
  enum CodingKeys: String, CodingKey {
    case id = "ITEM_ID"
    case gateId = "GATE_CHECK_ID"
    case checkBoxValue = "CHECK_BOX"
    case approveFlagValue = "APPROVE_FLAG"
    case approverValue = "APPROVER"
    case textValue = "TEXT"
    case fileValue = "FILE"
    case title = "TITLE"
    case placeHolders = "HEADER"
    case headerTypes = "HEADER_FLAG"
    case dataTypes = "DATA_FLAG"
    case dataLookups = "DATA_LOOKUP"
    case order = "ITEM_ORDER"
  }
  
  var id: String
  var gateId: String
  var checkBoxValue: String
  var approveFlagValue: String
  var approverValue: String
  var textValue: String
  var fileValue: String
  var title: String
  var placeHolders: String
  var headerTypes: String
  var dataTypes: String
  var dataLookups: String
  var order: String
  
  init() {
    id = "0"
    gateId = "0"
    checkBoxValue = ""
    approveFlagValue = ""
    approverValue = ""
    textValue = ""
    fileValue = ""
    title = ""
    placeHolders = ""
    headerTypes = ""
    dataTypes = ""
    dataLookups = ""
    order = ""
  }
  
}
