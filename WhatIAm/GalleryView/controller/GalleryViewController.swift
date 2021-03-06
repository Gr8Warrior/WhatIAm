//
//  GalleryViewController.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/5/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, GetGoogleImageParserDelegate {

  var collectionView : UICollectionView?
  var parser: GetGoogleImageParser?
  var googleImages: [GoogleImage] = []
  var modalView: UIView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.cyan
    edgesForExtendedLayout = UIRectEdge()
    
    modalView = UIView(frame: self.view.frame)
    
    parser = GetGoogleImageParser()
    parser?.delegate = self
    parser!.getGoogleImages(string: "india")
    
    setUpSearchBar()
    setUpCollectionView()
  }
  
  func setUpCollectionView() {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize = CGSize(width: 120, height: 120)
    
    collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    collectionView?.dataSource = self
    collectionView?.delegate = self
    collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    collectionView?.backgroundColor = UIColor.green
    self.view.addSubview(collectionView!)
  }
  
  func setUpSearchBar() {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchBar.delegate = self
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return googleImages.count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)

    myCell.contentView.subviews.forEach { $0.removeFromSuperview() }
    
    let imageView : UIImageView = UIImageView(image: googleImages[indexPath.row].thumbnail)
    imageView.contentMode = UIViewContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    myCell.contentView.addSubview(imageView)
    return myCell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("index path \(indexPath.row)")
    guard let url = googleImages[indexPath.row].link,
      let imageData = try? Data(contentsOf: url as URL) else {
        return
    }
    if let image = UIImage(data: imageData) {
      var imageView = UIImageView(image: image)
      self.modalView?.addSubview(imageView)
      self.modalView?.bringSubview(toFront: self.view)
    }
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("shailu \(searchText)")
    //parser?.getGoogleImages(string: searchText)
    
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    self.googleImages = []
    collectionView?.reloadData()
    parser?.getGoogleImages(string: searchBar.text!)
    print("end")
  }
  
  
  func didReceiveGoogleImages(_ images: [GoogleImage]) {
    print("number of images \(images.count)")
    
    googleImages = images
    self.collectionView?.reloadData()
  }
  
}
