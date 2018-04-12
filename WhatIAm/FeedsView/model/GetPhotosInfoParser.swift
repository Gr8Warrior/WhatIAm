//
//  GetPhotosInfo.swift
//  FlickrTest
//
//  Created by Shailendra Suriyal on 4/11/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

@objc protocol GetPublicPhotoInfoParserDelegate: NSObjectProtocol{
    func didReceivePublicPhotoInfo(_ images: [PublicPhoto])
    @objc optional func didReceiveError()
  }
  //parser for web service
class GetPhotosInfoParser: NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    
  var webData: Data?
  var publicPhotos: [PublicPhoto]?
  weak var delegate: GetPublicPhotoInfoParserDelegate?
  var count: Int?
  
   // weak var delegate: GetPublicPhotoParserDelegate?
    //  weak var delegate: GetGoogleImageParserDelegate?
    
    //initializing a var using closure
    var session: URLSession {
      count = 0
      let defaultConfig = URLSessionConfiguration.default
      defaultConfig.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
      
      let session1 = URLSession(configuration: defaultConfig, delegate: self, delegateQueue: nil)
      
      return session1
    }
    
    func getGoogleImages(publicPhoto: [PublicPhoto]) {
      publicPhotos = publicPhoto
      /*
       1. Create a URL
       2. Create a Request
       3. Create a connection
       4. Get the response
       5. Get the data
       */
      
      for i in 0..<publicPhoto.count {
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=7300189187d24544a556922409d82f6e&photo_id=\(publicPhoto[i].id!)&format=json&nojsoncallback=1")
        
        /*
         For post service you need to use request object
         */
        let task = session.downloadTask(with: url!)
        
        task.resume()
      }
      
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
        self.count = count! + 1
        webData = try Data(contentsOf: location)
        let responseString = String(data: webData!, encoding: String.Encoding.utf8)
        print("responseString \(responseString!)")
        
        let result = try JSONSerialization.jsonObject(with: webData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
        
        let status = result["stat"] as! String
        print("shailu")
        if status == "ok" {
          
          let photos = result["photo"] as! [String: Any]
          
          for i in 0..<(publicPhotos?.count)! {
            if publicPhotos![i].id == (photos["id"] as! String) {
              
              publicPhotos![i].views = photos["views"] as? String
              publicPhotos![i].taken = (photos["dates"] as! [String: Any])["taken"] as? String
              
            }
            
          }
          
          
          //let googleImage = PublicPhoto(dictionary: data[i])
          // googleImageData.append(googleImage)
          if count == 5 {
            DispatchQueue.main.async {
              if self.delegate != nil {
                self.delegate?.didReceivePublicPhotoInfo(self.publicPhotos!)
              }
            }
          }
        }
        
      } catch {
        DispatchQueue.main.async {
          if self.delegate != nil {
            //if this is implemented
            if self.delegate!.responds(to: #selector(GetPublicPhotoParserDelegate.didReceiveError)) {
              self.delegate!.didReceiveError!()
            }
          }
        }
      }
      
    }
}



