//
//  ViewController.swift
//  Project 03
//
//  Created by pans on 16/3/11.
//  Copyright © 2016年 gtintel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView = UITableView()
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.title = "Watch Later"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()

        self.createSubViews()
    }
    
    func createSubViews() {
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.blackColor()
        tableView.registerClass(VideoTableViewCell.self, forCellReuseIdentifier: "VideoCell")
        self.view.addSubview(tableView)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoTableViewCell
        
        let celldata = data[indexPath.row]
        cell.cellImage.image = UIImage(named: celldata.image)
        cell.cellTitle.text = celldata.title
        cell.cellSource.text = celldata.source
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2 {
            
        }
    }
}

