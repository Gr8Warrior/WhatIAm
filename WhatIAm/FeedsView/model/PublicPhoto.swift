//
//  PublicPhoto.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/12/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class PublicPhoto: NSObject {
  
  var title : String?
  var id : String?
  var secret : String?
  var server : String?
  var farm: Int?
  var views: String?
  var taken: String?
  var imageURL: URL?
  var image: UIImage?
  
  init(dictionary: [String: Any]) {
    title = dictionary["title"]! as? String
    id = dictionary["id"]! as? String
    secret = dictionary["secret"]! as? String
    server = dictionary["server"]! as? String
    farm = dictionary["farm"]! as? Int
    imageURL = URL(string: "https://farm\(farm!).staticflickr.com/\(server!)/\(id!)_\(secret!)_m.jpg")
    guard let url = self.imageURL,
      let imageData = try? Data(contentsOf: url as URL) else {
        return
    }
    self.image = UIImage(data: imageData)
  }
}


