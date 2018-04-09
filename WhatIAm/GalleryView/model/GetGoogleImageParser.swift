//
//  GetGoogleImageParser.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/9/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit


  
  @objc protocol GetGoogleImageParserDelegate: NSObjectProtocol{
    func didReceiveGoogleImages(_ images: [GoogleImage])
    @objc optional func didReceiveError()
  }
  
  //parser for web service
class GetGoogleImageParser: NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    
    var webData: Data?
    
    weak var delegate: GetGoogleImageParserDelegate?
    
    //initializing a var using closure
    var session: URLSession {
      
      let defaultConfig = URLSessionConfiguration.default
      defaultConfig.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
      
      let session1 = URLSession(configuration: defaultConfig, delegate: self, delegateQueue: nil)
      
      return session1
    }
    
  func getGoogleImages(string: String) {
      /*
       1. Create a URL
       2. Create a Request
       3. Create a connection
       4. Get the response
       5. Get the data
       */
      
      let url = URL(string: "https://www.googleapis.com/customsearch/v1?key=AIzaSyDYmVAMmX7ug7m9QKOth4yOBkvaOtFnk0Q&cx=010851423802901050718:wqqsvikv4qo&q=india&searchType=image")
      
      /*
       For post service you need to use request object
       */
      let task = session.downloadTask(with: url!)
      
      task.resume()
      // to secondary thread
      //    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
      //      self.shailu()
      //    }
      
    }
    
    func shailu(){
      //return to main queue
      //    DispatchQueue.main.async {
      //      <#code#>
      //    }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
      /*
       do {
       try stmt1
       stmt2
       stmt3
       try stmt4
       } catch() {
       }
       */
      do {
        
        webData = try Data(contentsOf: location)
        let responseString = String(data: webData!, encoding: String.Encoding.utf8)
        print("responseString \(responseString!)")
        
        let result = try JSONSerialization.jsonObject(with: webData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
        
        let status = result["kind"] as! String
        if status == "customsearch#search" {
          let data = result["items"] as! [[String: Any]]
          var googleImageData: [GoogleImage] = []
          
          for i in 0..<data.count {
            let userType = GoogleImage(dictionary: data[i])
            googleImageData.append(userType)
          }
          DispatchQueue.main.async {
            if self.delegate != nil {
              self.delegate?.didReceiveGoogleImages(googleImageData)
            }
          }
        }
        
      } catch {
        DispatchQueue.main.async {
          if self.delegate != nil {
            //if this is implemented
            if self.delegate!.responds(to: #selector(GetGoogleImageParserDelegate.didReceiveError)) {
              self.delegate!.didReceiveError!()
            }
          }
        }
      }
      
    }
}

