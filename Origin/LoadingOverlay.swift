//
//  LoadingOverlay.swift
//  Vision
//
//  Created by Shomil Jain on 1/2/19.
//  Copyright © 2019 Avina Labs. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

public class LoadingOverlay {
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var nvActivity: NVActivityIndicatorView!
    var label: UILabel!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(_ view: UIView!, text: String = "") {
        
        DispatchQueue.main.async {
            self.overlayView = UIView(frame: UIScreen.main.bounds)
            self.overlayView.backgroundColor = UIColor.systemFill
            
            // add nActivity
            let rect = CGRect(x: self.overlayView.center.x - 25, y: self.overlayView.center.y + 250, width: 50, height: 50)
            
            self.nvActivity = NVActivityIndicatorView(frame: rect)
            self.nvActivity.color = .white
            self.nvActivity.type = .audioEqualizer
            self.nvActivity.backgroundColor = .clear
            self.nvActivity.startAnimating()
            self.overlayView.addSubview(self.nvActivity)
            
            let labelRect = CGRect(x: 0, y: self.overlayView.center.y + 50, width: self.overlayView.frame.width, height: 30)
            self.label = UILabel(frame: labelRect)
            self.label.textAlignment = .center
            self.label.font = UIFont.systemFont(ofSize: 20)
            self.label.minimumScaleFactor = 0.5
            self.label.textColor = UIColor.white
            self.label.text = text
            self.overlayView.addSubview(self.label)
            
            view.addSubview(self.overlayView)
        }
    }
    
    public func hideOverlayView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            if self.nvActivity != nil {
                self.nvActivity.stopAnimating()
            }
            self.overlayView.removeFromSuperview()
        }
    }
}
