//
//  GoogleImage.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/9/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class GoogleImage: NSObject {
  
  var thumbnail : UIImage?
  var largeImage : UIImage?
  
  let title : String?
  var link: URL?
  var thumbnailLink: URL?
  
  init(dictionary: [String: Any]) {
    title = dictionary["title"]! as? String
    link = URL(string: (dictionary["link"]! as? String)!)
    thumbnailLink = URL(string: (dictionary["image"] as! [String:Any])["thumbnailLink"]! as! String)
    
  }
  
}
