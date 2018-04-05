//
//  ViewController.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/4/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  var editMode: Bool?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.red
    edgesForExtendedLayout = UIRectEdge()
    editMode = false
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action:  #selector(ProfileViewController.edit))
    }

@objc func edit() {
    print("Edited")
  if !editMode! {
    self.navigationItem.rightBarButtonItem?.title = "Save"
  }else{
    self.navigationItem.rightBarButtonItem?.title = "Edit"
  }
  editMode = !editMode!
  
  }

}

