//
//  UIViewController.swift
//  Smiles
//
//  Created by Ahmed samir on 27/02/2020.
//  Copyright © 2020 Ahmed samir. All rights reserved.
//

import UIKit

// MARK: - extension
extension UIViewController {
    
    // MARK: properties
    // UIViewController storyboard ID
    static var storyboardID: String {
        return "\(self)"
    }
    
    // MARK: - Handler method
    // instatiate UIViewController instance
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    // MARK: enum
    // Storyboard name
    enum AppStoryboard: String {
        case Main
        
        var instance: UIStoryboard {
            return UIStoryboard(name: rawValue, bundle: Bundle.main)
        }
        
        func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
            let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
            return instance.instantiateViewController(withIdentifier: storyboardID) as! T
        }
        
        func initialViewController() -> UIViewController? {
            return instance.instantiateInitialViewController()
        }
    }
    
    func showAlertWith(message: String, title: String = "", completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let completion = completion{
            let OKAction = UIAlertAction(title: "YES", style: .default, handler: completion)
            alertController.addAction(OKAction)
            let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: completion)
            alertController.addAction(cancelAction)
        }
        else{
            let OKAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
            alertController.addAction(OKAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
}
