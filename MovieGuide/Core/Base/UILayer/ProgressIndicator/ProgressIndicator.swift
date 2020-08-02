//
//  ProgressIndicator.swift
//  Smiles
//
//  Created by Usman Tarar on 16/09/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

@objc class ProgressIndicator: UIView {
    // Public properties
    var size: CGFloat = 0.0
    
    // Private members
    private var indicatorView: UIActivityIndicatorView?
    private var bgView: UIView?
    private var shouldShowFullScreen = false
    var indicatorColor: UIColor = UIColor(red: 144/255, green: 206/255, blue: 161/255, alpha: 1.0)
    var bgColor: UIColor = .clear
    
    @objc static var sharedInstance: ProgressIndicator = {
        var sharedIndicator = ProgressIndicator()
        sharedIndicator.size = 30
        sharedIndicator.shouldShowFullScreen = true
        return sharedIndicator
    }()
    
    class func shared() -> ProgressIndicator {
        return sharedInstance
    }
    override func awakeFromNib(){
        super.awakeFromNib()
        showInScreenIndicator()
    }
    
    func showInScreenIndicator() {
        shouldShowFullScreen = false
        indicatorView = getIndicatorWithSize(min(bounds.size.width, bounds.size.height))
        indicatorView?.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        indicatorView?.startAnimating()
        if let indicator = indicatorView {
            addSubview(indicator)
        }
    }
    
    @objc func show(asFullScreen shouldFullScreen: Bool = true) {
        shouldShowFullScreen = shouldFullScreen
        DispatchQueue.main.async(execute: {
            if self.indicatorView?.isAnimating == nil || self.indicatorView?.isAnimating == false {
                self.indicatorView = self.getIndicatorWithSize(self.size)
                self.indicatorView?.startAnimating()
                if let indicatorView = self.indicatorView {
                    UIApplication.upfrontWindow()?.addSubview(indicatorView)
                }
            }
        })
    }
    
    @objc func hide() {
        DispatchQueue.main.async(execute: {
            self.bgView?.removeFromSuperview()
            self.indicatorView?.stopAnimating()
            self.indicatorView?.removeFromSuperview()
        })
    }
    
    func isAnimating() -> Bool {
        return indicatorView?.isAnimating ?? false
    }
    
    func getIndicatorWithSize(_ size: CGFloat) -> UIActivityIndicatorView {
        let indicatorView = createIndicatorView(withSize: size)
        if shouldShowFullScreen {
            let screenSize = UIScreen.main.bounds
            bgView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height))
            
            if let bg = bgView {
                bg.backgroundColor = bgColor
                UIApplication.upfrontWindow()?.addSubview(bg)
            }
        }
        return indicatorView
    }
    
    func createIndicatorView(withSize size: CGFloat) -> UIActivityIndicatorView {
        let screenSize = UIScreen.main.bounds
        
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = indicatorColor
        activityIndicatorView.transform = CGAffineTransform(scaleX: 2, y: 2)
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height)
        if let center = UIApplication.upfrontWindow()?.rootViewController?.view.center {
            activityIndicatorView.center = center
        }
        
        UIApplication.upfrontWindow()?.rootViewController?.view.endEditing(true)
        return activityIndicatorView
    }
}
