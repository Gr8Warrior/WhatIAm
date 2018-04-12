//
//  FeedsTableViewCell.swift
//  FlickrTest
//
//  Created by Shailendra Suriyal on 4/11/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class FeedsTableViewCell: UITableViewCell {
  
  var titleLabel: UILabel?
  var viewLabel: UILabel?
  var takenLabel: UILabel?
  var photoView: UIImageView?
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
    titleLabel?.textAlignment = NSTextAlignment.center
    self.addSubview(titleLabel!)
    photoView = UIImageView(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 210))
    photoView?.contentMode = .scaleAspectFill
    photoView?.clipsToBounds = true
    self.addSubview(photoView!)
    viewLabel = UILabel(frame: CGRect(x: 0, y: 250, width: UIScreen.main.bounds.width * 0.5, height: 50))
    self.addSubview(viewLabel!)
    takenLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width - UIScreen.main.bounds.width * 0.5, y: 250, width: UIScreen.main.bounds.width * 0.5, height: 50))
    takenLabel?.adjustsFontSizeToFitWidth = true
    self.addSubview(takenLabel!)
  }
  
  //Mostly never needed
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var frame: CGRect {
    get {
      return super.frame
    }
    set (newFrame) {
      var frame = newFrame
      let newWidth = frame.width //* 0.90 // get 80% width here
      let space = (frame.width - newWidth) / 2
      frame.size.width = newWidth
      frame.origin.x += space
      
      super.frame = frame
      
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

