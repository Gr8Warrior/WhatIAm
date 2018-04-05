//
//  FeedsViewCell.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/5/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

class FeedsViewCell: UITableViewCell {
  
  var feedsImageView: UIImageView?
  var likesImageView: UIImageView?
  var commentsImageView: UIImageView?
  var likeCountLabel: UILabel?
  var commentsCountLabel: UILabel?

  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    feedsImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: frame.size.width, height: 120))
    feedsImageView?.image = UIImage(named: "india")
    feedsImageView?.contentMode = .scaleAspectFill
    feedsImageView?.clipsToBounds = true;
   // feedsImageView?.sizeToFit()
    self.addSubview(feedsImageView!)
//    nameLabel = UILabel(frame: CGRect(x: 80, y: 10, width: 210, height: 25))
//    self.addSubview(nameLabel!)
//    publisherNameLabel = UILabel(frame: CGRect(x: 80, y: 45, width: 210, height: 25))
//    self.addSubview(publisherNameLabel!)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
