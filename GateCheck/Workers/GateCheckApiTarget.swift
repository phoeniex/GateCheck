//
//  GateCheckApiTarget.swift
//  Gate Check
//
//  Created by Rawipon Srivibha on 17/12/18.
//  Copyright © 2018 Allianz. All rights reserved.
//

import Foundation
import Moya

enum GateCheckApiTarget {
  case login(endpoint: String, userName: String, password: String)
  case logout(endpoint: String)
  case getCheckLists(endpoint: String, groupId: String?, status: CheckListStatus?, createdDate: Date?)
  case getCheckListDetail(endpoint: String, id: String)
  case getLookupData(endpoint: String, field: String)
}

extension GateCheckApiTarget: TargetType {
  
  var baseURL: URL {
    switch self {
    case .login(let endpoint, _, _),
         .logout(let endpoint),
         .getCheckLists(let endpoint, _, _, _),
         .getCheckListDetail(let endpoint, _),
         .getLookupData(let endpoint, _):
      return URL(string: endpoint)!
    }
  }
  
  var path: String {
    switch self {
    case .login: return "/login.php"
    case .logout: return "/logout.php"
    case .getCheckLists: return "/gate_check_list_info.php"
    case .getCheckListDetail: return "/gate_check_get_info.php"
    case .getLookupData: return "/getlookup.php"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .login,
         .logout,
         .getCheckLists,
         .getCheckListDetail,
         .getLookupData:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .login(_, let userName, let password):
      return .requestParameters(parameters: ["user": userName, "password": password], encoding: URLEncoding.default)
    case .logout:
      return .requestPlain
    case .getCheckLists(_, let groupId, let checkListStatus, let createdDate):
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "ddMMyyyy"
      dateFormatter.calendar = Calendar(identifier: .gregorian)
      
      var parameters: [String: String] = [:]
      parameters["ATLANTA_GROUP_ID"] = groupId
      parameters["STATUS_CODE"] = checkListStatus?.rawValue
      parameters["CREATED_DATE"] = createdDate != nil ? dateFormatter.string(from: createdDate!) : nil
      return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    case .getCheckListDetail(_, let id):
      return .requestParameters(parameters: ["ID": id], encoding: URLEncoding.default)
    case .getLookupData(_, let field):
      return .requestParameters(parameters: ["lookup_name": field,
                                             "object_type": "json"],
                                encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
  
  var validationType: ValidationType {
    return .successCodes
  }
  
}
