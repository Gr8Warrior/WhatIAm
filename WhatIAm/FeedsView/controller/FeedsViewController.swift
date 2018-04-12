//
//  FeedsViewController.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/5/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, GetPublicPhotoParserDelegate, GetPublicPhotoInfoParserDelegate, UITableViewDelegate, UITableViewDataSource {
  
  var parser: GetPhotosParser?
  var getPhotoInfoParser: GetPhotosInfoParser?
  var feedTableView: UITableView?
  var publicPhotos: [PublicPhoto]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setuptableView()
    
    self.view.backgroundColor = UIColor.cyan
    edgesForExtendedLayout = UIRectEdge()
    parser = GetPhotosParser()
    parser?.delegate = self
    getPhotoInfoParser = GetPhotosInfoParser()
    getPhotoInfoParser?.delegate = self
    parser!.getGoogleImages(string: "india")
  }
  
  func setuptableView() {
    feedTableView = UITableView(frame: self.view.frame)
    feedTableView?.dataSource = self
    feedTableView?.delegate = self
    feedTableView?.rowHeight = 300
    self.view.addSubview(feedTableView!)
  }
  func didReceivePublicPhoto(_ images: [PublicPhoto]) {
    print("images received : \(images.count)")
    getPhotoInfoParser?.getGoogleImages(publicPhoto: images)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return publicPhotos?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: FeedsTableViewCell?
    cell = tableView.dequeueReusableCell(withIdentifier: "recell") as? FeedsTableViewCell
    
    if cell == nil {
      cell = FeedsTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "recell")
      cell?.preservesSuperviewLayoutMargins = false
      cell?.layoutMargins = UIEdgeInsets.zero
      
    }
    cell?.titleLabel?.text = "Title : \(publicPhotos![indexPath.row].title ?? "No Title")"
    cell?.photoView?.image = publicPhotos![indexPath.row].image
    cell?.viewLabel?.text = "views : \(publicPhotos![indexPath.row].views ?? "No Views")"
    cell?.takenLabel?.text = "Dated : \(publicPhotos![indexPath.row].taken ?? "Not available")"
    
    return cell!
  }
  
  func didReceivePublicPhotoInfo(_ images: [PublicPhoto]) {
    publicPhotos = images
    DispatchQueue.main.async {
      
      self.feedTableView?.reloadData()
    }
    print(images)
    
  }
  
  
}

