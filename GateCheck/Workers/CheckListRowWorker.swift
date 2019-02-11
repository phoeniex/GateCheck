//
//  CheckListRowWorker.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 5/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import Foundation

class CheckListRowWorker {
  
  func toDetailRow(_ rows: [CheckListDetail]) -> [DetailCellModel] {
    return rows.compactMap { $0.getRowType() }
  }
  
}

extension CheckListDetail {
  
  var dataTypeObjects: [DataType] {
    return dataTypes.components(separatedBy: ",").compactMap { DataType(rawValue: $0.uppercased()) }
  }
  
  var placeHolderObjects: [String] {
    return placeHolders.components(separatedBy: ",")
  }
  
  var fileObjects: [String] {
    return fileValue.components(separatedBy: ",").filter { $0.isEmpty == false }
  }
  
  func getPlaceHolderObject(_ placeHolderString: String) -> [String: String] {
    var returner: [String: String] = [:]
    placeHolderString.components(separatedBy: "|").forEach {
      let placeHolder = $0.components(separatedBy: ":")
      guard let key = placeHolder.first, let value = placeHolder.last else { return }
      guard key.uppercased() != "H" else { return }
      returner[key] = value
    }
    return returner
  }
  
  func getRowType() -> DetailCellModel? {
    let allDataType = dataTypeObjects.count
    if dataTypeObjects.filter({ $0 == .hidden }).count == allDataType {
      return toTitleCellModel()
    } else if dataTypeObjects.filter({ $0 == .hidden || $0 == .text }).count == allDataType {
      return toTextFormCellModel()
    } else if dataTypeObjects.contains(.dateTime) {
      return toDateFormCellModel()
    } else if dataTypeObjects.contains(.signature) {
      return toSignatureCellModel()
    } else if dataTypeObjects.filter({ $0 == .text }).count == 1 && dataTypeObjects.filter({ $0 == .radioBox }).count == 1 {
      return toRadioBoxWithTextCellModel()
    } else if dataTypeObjects.filter({ $0 == .text }).count == 1 && dataTypeObjects.filter({ $0 == .checkBox }).count == 1 {
      return toCheckBoxWithTextCellModel()
    } else if dataTypes == "R,R,T,T,P" {
      return toMultipleChoicesQuestionCellModel()
    }
    
    return nil
  }
  
  func toTitleCellModel() -> DetailCellModel {
    var cellModel = TitleCellModel()
    cellModel.rowId = id
    cellModel.title = title
    return cellModel
  }
  
  func toTextFormCellModel() -> DetailCellModel {
    var cellModel = TextFormCellModel()
    cellModel.rowId = id
    cellModel.text = textValue
    cellModel.placeHolder = title
    return cellModel
  }
  
  func toDateFormCellModel() -> DetailCellModel {
    var cellModel = DateFormCellModel()
    cellModel.rowId = id
    cellModel.dateString = textValue
    cellModel.placeHolder = title
    return cellModel
  }
  
  func toSignatureCellModel() -> DetailCellModel {
    var cellModel = SignatureCellModel()
    cellModel.rowId = id
    cellModel.title = title
    cellModel.approver = approverValue
    cellModel.imageUrls = fileObjects
    if let textDataFlagIndex = dataTypeObjects.firstIndex(of: .text) {
      cellModel.placeHolder = placeHolderObjects[textDataFlagIndex] ?? ""
    }
    return cellModel
  }
  
  func toRadioBoxWithTextCellModel() -> DetailCellModel {
    var cellModel = RadioBoxWithTextCellModel()
    cellModel.rowId = id
    cellModel.title = title
    cellModel.text = textValue
    
    if let textDataFlagIndex = dataTypeObjects.firstIndex(of: .text) {
      cellModel.placeHolder = placeHolderObjects[textDataFlagIndex]
    }
    
    if let radioBoxDataFlagIndex = dataTypeObjects.firstIndex(of: .radioBox) {
      let placeHolder = placeHolderObjects[radioBoxDataFlagIndex]
      let placeHolderObject = getPlaceHolderObject(placeHolder)
      cellModel.choices = placeHolderObject.map { $0.value }
      cellModel.choiceSelected = placeHolderObject.map({ $0.key }).firstIndex(of: checkBoxValue)
    }
    
    return cellModel
  }
    
  func toCheckBoxWithTextCellModel() -> DetailCellModel {
    var cellModel = CheckBoxWithTextCellModel()
    cellModel.rowId = id
    cellModel.text = textValue
    cellModel.isSelected = checkBoxValue.isEmpty == false
    
    if let textDataFlagIndex = dataTypeObjects.firstIndex(of: .checkBox) {
      let placeHolder = getPlaceHolderObject(placeHolderObjects[textDataFlagIndex])
      cellModel.placeHolder = placeHolder["1"] ?? ""
    }

    return cellModel
  }
  
  func toMultipleChoicesQuestionCellModel() -> DetailCellModel {
    var cellModel = MultipleChoicesQuestionCellModel()
    cellModel.rowId = id
    cellModel.question = title
    
    let choicePlaceHolder = placeHolderObjects[0]
    let choicePlaceHolderObject = getPlaceHolderObject(choicePlaceHolder)
    cellModel.choices = choicePlaceHolderObject.map { $0.value }
    cellModel.choiceSelected = choicePlaceHolderObject.map({ $0.key }).firstIndex(of: checkBoxValue)
    
    let approvePlaceHolder = placeHolderObjects[1]
    let approvePlaceHolderObject = getPlaceHolderObject(approvePlaceHolder)
    cellModel.approvalChoices = approvePlaceHolderObject.map { $0.value }
    cellModel.approvalSelected = approvePlaceHolderObject.map({ $0.key }).firstIndex(of: approverValue)
    
    cellModel.note = textValue
    cellModel.approver = approverValue
    cellModel.imageUrls = fileObjects
    
    return cellModel
  }
  
}
