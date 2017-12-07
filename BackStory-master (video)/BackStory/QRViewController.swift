//
//  QRViewController.swift
//  BackStory
//
//  Created by Dimitrios Vlahos on 12/5/17.
//  Copyright © 2017 Richu-Vlahos. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var topbar: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    let captureSession = AVCaptureSession()
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    var captureMetadataOutput = AVCaptureMetadataOutput()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Main
    func setVideoOreientation(){
        if let connection = self.videoPreviewLayer?.connection {
            if connection.isVideoOrientationSupported {
                connection.videoOrientation = self.videoOrientation()
                self.videoPreviewLayer?.frame = self.view.bounds
            }
        }
    }
    
    func initializeCamera() {
        self.captureSession.sessionPreset = AVCaptureSession.Preset.high
        
        let discovery = AVCaptureDevice.DiscoverySession.init(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back) as AVCaptureDevice.DiscoverySession
        for device in discovery.devices as [AVCaptureDevice] {
            if device.hasMediaType(AVMediaType.video) {
                if device.position == AVCaptureDevice.Position.back {
                    do {
                        let input = try AVCaptureDeviceInput(device: device)
                        if(captureSession.canAddInput(input)){
                            captureSession.addInput(input);
                            
                            if(captureSession.canAddOutput(sessionOutput)){
                                captureSession.addOutput(sessionOutput);
                                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
                                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                                
                                captureSession.addOutput(captureMetadataOutput)
                                captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                                captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                                
                                qrCodeFrameView = UIView()
                                if let qrCodeFrameView = qrCodeFrameView {
                                    qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                                    qrCodeFrameView.layer.borderWidth = 2
                                    view.addSubview(qrCodeFrameView)
                                    view.bringSubview(toFront: qrCodeFrameView)
                                }
                            }
                        }
                    } catch {
                        print("exception!")
                        return
                    }
                    
                    videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    videoPreviewLayer?.frame = view.layer.bounds
                    view.layer.addSublayer(videoPreviewLayer!)
                    captureSession.startRunning()
                    
                    view.bringSubview(toFront: messageLabel)
                    view.bringSubview(toFront: topbar)
                }
            }
        }
    }
    
    //MARK: Helpers
    
    func videoOrientation() -> AVCaptureVideoOrientation {
        
        var videoOrientation: AVCaptureVideoOrientation!
        
        let orientation:UIDeviceOrientation = UIDevice.current.orientation
        switch orientation {
        case .portrait:
            videoOrientation = .portrait
            break
        case .landscapeRight:
            videoOrientation = .landscapeLeft
            break
        case .landscapeLeft:
            videoOrientation = .landscapeRight
            break
        case .portraitUpsideDown:
            break
        default:
            videoOrientation = .portrait
        }
        
        return videoOrientation
    }
    
    func captureOutput(_ output: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
            }
        }
    }
}
