//
//  ViewController.swift
//  Project 02
//
//  Created by pans on 16/3/10.
//  Copyright © 2016年 gtintel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainText : UITextView!
    var changeBtn : UIButton!
    var index : NSInteger!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.title = "Custom Font"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.clearColor()
        
        mainText = UITextView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height/2))
        mainText.text = "Swift\n 这些字体特别适合打\n 阿打算加莱卡发到手机开发\n 爱的路上飞回来社发过来\n 法定好了卡还是放假啊回家了"
        mainText.textColor = UIColor.whiteColor()
        mainText.backgroundColor = UIColor.clearColor()
        mainText.font = UIFont.systemFontOfSize(20)
        self.view.addSubview(mainText)
        
        changeBtn = UIButton(frame: CGRectMake(self.view.frame.width/3, self.view.frame.height/2 + 50, self.view.frame.width/3, self.view.frame.width/3))
        changeBtn.backgroundColor = UIColor.yellowColor()
        changeBtn.setTitle("Change Font", forState: UIControlState.Normal)
        changeBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        changeBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        changeBtn.layer.masksToBounds = true
        changeBtn.layer.cornerRadius = changeBtn.frame.width/2
        changeBtn.addTarget(self, action: "changeBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(changeBtn)
        
        index = 0
    }
    
    func changeBtnClicked() {
        index = index + 1
        if index == 1 {
            mainText.font = UIFont(name: "ArialMT", size: 15)
        } else if index == 2 {
            mainText.font = UIFont(name: "Verdana-Bold", size: 15)
        } else if index == 3 {
            mainText.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 15)
        } else if index == 4 {
            mainText.font = UIFont(name: "STHeitiJ-Medium", size: 15)
        } else if index == 5 {
            mainText.font = UIFont(name: "MarkerFelt-Thin", size: 15)
            index = 1
        }
    }
}

