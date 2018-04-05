//
//  FeedsViewController.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/5/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var tableOfFeeds: UITableView?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor.blue
      edgesForExtendedLayout = UIRectEdge()
      loadTableView()
    }
  
  func loadTableView() {
    
    tableOfFeeds = UITableView(frame: self.view.frame)
    tableOfFeeds?.delegate = self
    tableOfFeeds?.dataSource = self
    tableOfFeeds?.rowHeight = 200
    tableOfFeeds?.separatorStyle = UITableViewCellSeparatorStyle.singleLine
    self.view.addSubview(tableOfFeeds!)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var feedCell: FeedsViewCell?
    feedCell = tableView.dequeueReusableCell(withIdentifier: "feeds") as? FeedsViewCell
    
    if feedCell == nil {
      feedCell = FeedsViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "feeds")
    }
    feedCell?.textLabel?.text = "shailu"
    
    return feedCell!
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
