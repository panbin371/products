//
//  ViewController.swift
//  Project 04
//
//  Created by pans on 16/3/21.
//  Copyright © 2016年 gtintel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var captureSession : AVCaptureSession!
    var previewLayer : AVCaptureVideoPreviewLayer!
    var device : AVCaptureDevice!
    var input : AVCaptureDeviceInput!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPresetHigh //画质分辨率
        device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo) //摄像头设置
        
        var errors : NSError?
        do {
            input = try AVCaptureDeviceInput(device: device) }
        catch let errorTemp as NSError {
            errors = errorTemp
            input = nil
        }
        
        if (errors == nil && input != nil) {
            captureSession.addInput(input)
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspect //图像填充
            previewLayer.connection.videoOrientation = AVCaptureVideoOrientation.Portrait //放心设置，不可放在viewDidLoad中，
            self.view.layer.addSublayer(previewLayer)
            
            captureSession.startRunning()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer.frame = self.view.bounds
    }


}

