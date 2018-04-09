//
//  GalleryViewController.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/5/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, GetGoogleImageParserDelegate {
  
  func didReceiveGoogleImages(_ images: [GoogleImage]) {
    print("number of images \(images.count)")
    googleImages = images
    self.collectionView?.reloadData()
  }
  
  var collectionView : UICollectionView?
  var parser: GetGoogleImageParser?
  var googleImages: [GoogleImage] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.cyan
    edgesForExtendedLayout = UIRectEdge()
    
    parser = GetGoogleImageParser()
    parser?.delegate = self
    parser!.getGoogleImages(string: "india")
    
    setUpSearchBar()
    setUpCollectionView()
  }
  
  func setUpCollectionView() {
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
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

  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return googleImages.count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
  @available(iOS 6.0, *)
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
    
    myCell.backgroundColor = UIColor.blue
    return myCell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("index path \(indexPath.row)")
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("shailu \(searchText)")
    
  }
  
}
