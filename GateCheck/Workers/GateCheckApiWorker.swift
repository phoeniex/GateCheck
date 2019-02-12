//
//  GateCheckApiWorker.swift
//  Gate Check
//
//  Created by Rawipon Srivibha on 17/12/18.
//  Copyright © 2018 Allianz. All rights reserved.
//

import Foundation
import Result
import Moya

enum APIError: Error {
  case emptyUserToken
  case webService(Error?)
  case sessionTimeOut
}

class GateCheckApiWorker {
  
  lazy var provider = MoyaProvider<GateCheckApiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
  
  var endpoint: String {
    get { return UserDefaults.standard.string(forKey: "Endpoint") ?? "" }
    set { UserDefaults.standard.set(newValue, forKey: "Endpoint") }
  }
  
  func getImageUrl(_ imageName: String) -> String {
    return endpoint + "/upload/" + imageName
  }
  
  func login(username: String, password: String, completion: @escaping (Result<Void, APIError>) -> Void) {
    let endpoint = self.endpoint
    provider.request(.logout(endpoint: endpoint)) { [weak self] (_) in
      self?.provider.request(.login(endpoint: endpoint, userName: username, password: password))
      { (result) in
        do {
        switch result {
          case .success:
            completion(.success(()))
          case .failure(let error):
            throw error
          }
        } catch {
          completion(.failure(.webService(error)))
        }
      }
    }
  }

  // TODO:: have to convert group name to group id
  func getCheckLists(groupName: String?, status: CheckListStatus?, createdDate: Date?,
                     completion: @escaping (Result<[CheckList], APIError>) -> Void) {
    provider.request(.getCheckLists(endpoint: endpoint, groupId: groupName, status: status, createdDate: createdDate)) { (result) in
      do {
        switch result {
        case .success(let response):
          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
          formatter.calendar = Calendar(identifier: .gregorian)
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(formatter)
          let htmlString = response.data.toHtmlString.trimmingGarbageCharacters
          let htmlStringData = Data(htmlString.utf8)
          let checkList = try decoder.decode(CheckListResponse.self, from: htmlStringData)
          completion(.success(checkList.data))
        case .failure(let error):
          throw APIError.webService(error)
        }
      } catch {
        completion(.failure(.webService(error)))
      }
    }
  }
  
  func getCheckListDetail(id: String, completion: @escaping (Result<[CheckListDetail], APIError>) -> Void) {
    provider.request(.getCheckListDetail(endpoint: endpoint, id: id)) { (result) in
      do {
        switch result {
        case .success(let response):
          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
          formatter.calendar = Calendar(identifier: .gregorian)
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(formatter)
          let htmlString = response.data.toHtmlString.trimmingGarbageCharacters
          let htmlStringData = Data(htmlString.utf8)
          let checkList = try decoder.decode(CheckListDetailResponse.self, from: htmlStringData)
          completion(.success(checkList.rows))
        case .failure(let error):
          throw APIError.webService(error)
        }
      } catch {
        completion(.failure(.webService(error)))
      }
    }
  }
  
}
