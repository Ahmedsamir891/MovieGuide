//
//  UIView.swift
//  Smiles
//
//  Created by Ahmed samir on 22/07/20.
//  Copyright © 2020 Ahmed samir. All rights reserved.
//

import Foundation
import UIKit



extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat{
        set {
            return layer.cornerRadius = newValue
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor{
        set {
            return layer.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat{
        set {
            return layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
}
