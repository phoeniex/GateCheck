//
//  DKImageProvider.swift
//  GateCheck
//
//  Created by Rawipon Srivibha on 11/2/19.
//  Copyright © 2019 Allianz. All rights reserved.
//

import Foundation
import DKImagePickerController
import Kingfisher
import Photos

struct DKImageProvider: ImageDataProvider {
  var cacheKey: String { return asset.localIdentifier }
  let asset: DKAsset
  let size: CGSize
  
  init(asset: DKAsset, size: CGSize) {
    self.asset = asset
    self.size = size
  }
  
  func data(handler: @escaping (Result<Data, Error>) -> Void) {
    asset.fetchImage(with: size) { (image, _) in
      if let imageData = image?.pngData() {
        handler(.success(imageData))
      }
    }
  }
}
