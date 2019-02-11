//
//  CheckList.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 12/1/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import Foundation

enum CheckListStatus: String, Codable {
  case checkIn = "1"
  case checkOut = "2"
}

struct CheckListResponse: Codable {
  
  enum CodingKeys: String, CodingKey {
    case data = "DATA"
  }
  
  var data: [CheckList]

}

struct CheckList: Codable {
  
  enum CodingKeys: String, CodingKey {
    case id = "ID"
    case versionId = "VERSION_ID"
    case groupName = "ATLANTA_GROUP_NAME"
    case groupId = "ATLANTA_GROUP_ID"
    case licensePlate = "HEAD_CONTAINER"
    case status = "STATUS_CODE"
    case createdDate = "CREATED_DATE"
    case lastModifiedDate = "LAST_MODIFIED"
  }
  
  var id: String
  var versionId: String
  var groupName: String
  var groupId: String
  var licensePlate: String
  var status: CheckListStatus
  var createdDate: Date
  var lastModifiedDate: Date
  
  init() {
    id = "1"
    versionId = "1"
    groupName = "Site 1"
    groupId = "0"
    licensePlate = "AB-1243"
    status = .checkIn
    createdDate = Date()
    lastModifiedDate = Date()
  }
}


