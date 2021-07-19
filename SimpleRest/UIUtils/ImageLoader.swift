//
//  Extensions.swift
//  SimpleRest
//
//  Created by extdev on 19.07.2021.
//

import UIKit
import CloudKit

class ImageLoader {
  
  static var cach = NSCache<CKRecord.ID, AnyObject>()
  
  static func load(url: String?) -> UIImage {
    guard url != nil else {
      return UIImage()
    }
    if let imageUrl = cach.object(forKey: CKRecord.ID(recordName: url!)) as? URL {
      if let data = try? Data(contentsOf: imageUrl) {
        return UIImage(data: data) ?? UIImage()
      }
    }
    let imageUrl = URL(string: url ?? "")!
    let data = try! Data(contentsOf: imageUrl)
    self.cach.setObject(url as AnyObject, forKey: CKRecord.ID(recordName: url!))
    return UIImage(data: data)!
  }
}

