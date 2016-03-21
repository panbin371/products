//
//  ViewController.swift
//  Project 01
//
//  Created by pans on 16/3/9.
//  Copyright © 2016年 gtintel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timeLabel : UILabel!
    var resetBtn : UIButton!
    var startBtn : UIButton!
    var pauseBtn : UIButton!
    var timer = NSTimer()
    var timeFloat : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timeFloat = 0.0
        
        self.timeLabel = UILabel()
        self.timeLabel.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height/3)
        self.timeLabel.backgroundColor = UIColor.blackColor()
        self.timeLabel.textAlignment = NSTextAlignment.Center
        self.timeLabel.textColor = UIColor.whiteColor()
        self.timeLabel.text = "0.0"
        self.timeLabel.font = UIFont.systemFontOfSize(60)
        self.view.addSubview(self.timeLabel)
        
        self.resetBtn = UIButton(type: UIButtonType.System)
        self.resetBtn.frame = CGRectMake(self.view.frame.width/5*4, self.timeLabel.frame.height/5, self.timeLabel.frame.width/10, self.timeLabel.frame.height/10)
        self.resetBtn.backgroundColor = UIColor.clearColor()
        self.resetBtn.setTitle("reset", forState: UIControlState.Normal)
        self.resetBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.resetBtn.addTarget(self, action: "resetBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.resetBtn)

        self.startBtn = UIButton(type: UIButtonType.System)
        self.startBtn.frame = CGRectMake(0, self.view.frame.height/3, self.view.frame.width/2, self.view.frame.height/3*2)
        self.startBtn.backgroundColor = UIColor(red: 82.0/255.0, green: 91.0/255.0, blue: 252.0/255.0, alpha: 1)
        self.startBtn.setTitle("start", forState: UIControlState.Normal)
        self.startBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.startBtn.addTarget(self, action: "startBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.startBtn.showsTouchWhenHighlighted = true
        self.view.addSubview(self.startBtn)
        
        self.pauseBtn = UIButton(type: UIButtonType.System)
        self.pauseBtn.frame = CGRectMake(self.view.frame.width/2, self.view.frame.height/3, self.view.frame.width/2, self.view.frame.height/3*2)
        self.pauseBtn.backgroundColor = UIColor(red: 102.0/255.0, green: 189.0/255.0, blue: 9.0/255.0, alpha: 1)
        self.pauseBtn.setTitle("pause", forState: UIControlState.Normal)
        self.pauseBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.pauseBtn.addTarget(self, action: "pauseBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.pauseBtn.showsTouchWhenHighlighted = true
        self.view.addSubview(self.pauseBtn)
        
    }
    
    func resetBtnClicked() {
        self.timer.invalidate()
        self.timeFloat = 0.0
        self.timeLabel.text = "\(self.timeFloat)"
    }
    
    func startBtnClicked() {

        if !self.timer.valid {
            //放入后台线程防止主线程阻塞定时器
            dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
                self.timer = NSTimer.init(timeInterval: 0.1, target: self, selector: "readTime", userInfo: nil, repeats: true)
                NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSDefaultRunLoopMode)
                NSRunLoop.currentRunLoop().run()
            })
        }
    }
    
    func pauseBtnClicked() {
        self.timer.invalidate()
    }
    
    func readTime() {
        self.timeLabel.text = "\(self.timeFloat)"
        self.timeFloat = self.timeFloat + 0.1
    }
}

