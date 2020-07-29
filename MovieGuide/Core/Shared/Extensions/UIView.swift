//
//  UIView.swift
//  Smiles
//
//  Created by Ahmed samir on 22/07/20.
//  Copyright © 2020 Ahmed samir. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    var borderUIColor: UIColor {
        set {
            self.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}

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
    
    func styleView(borderColor: UIColor, borderWitdh: CGFloat = 1.0, cornerRadius: CGFloat = 0.0 ) {
        clipsToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWitdh
        layer.cornerRadius = cornerRadius
    }
}
