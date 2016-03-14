//
//  VideoTableViewCell.swift
//  Project 03
//
//  Created by pans on 16/3/14.
//  Copyright © 2016年 gtintel. All rights reserved.
//

import UIKit

struct video {
    let image:String
    let title:String
    let source:String
}

class VideoTableViewCell: UITableViewCell {

    var cellImage = UIImageView()
    var cellTitle = UILabel()
    var cellSource = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellImage.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 220)
        
        cellTitle.frame = CGRectMake(128, 173, 119, 20)
        cellTitle.font = UIFont(name: "Avenir Next Heavy", size: 14)
        cellTitle.textColor = UIColor.whiteColor()
        cellTitle.textAlignment = NSTextAlignment.Center
        
        cellSource.frame = CGRectMake(151, 197, 73, 14)
        cellSource.font = UIFont(name: "Avenir Next Heavy", size: 10)
        cellSource.textColor = UIColor.grayColor()
        cellSource.textAlignment = NSTextAlignment.Center
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.frame = CGRectMake(UIScreen.mainScreen().bounds.width/2-25, 85, 50, 50)
        btn.setImage(UIImage(named: "playBtn"), forState: UIControlState.Normal)
        
        self.contentView.addSubview(cellImage)
        self.contentView.addSubview(cellTitle)
        self.contentView.addSubview(cellSource)
        self.contentView.addSubview(btn)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
