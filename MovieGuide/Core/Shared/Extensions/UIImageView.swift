//
//  UIImageView.swift
//  Smiles
//
//  Created by Khawar Shazad on 25/03/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit
//import Kingfisher

extension UIImageView {
    
    func roundImageView() {
        self.layer.cornerRadius = self.frame.size.width * 0.5
        self.layer.borderWidth = 0.5
        //self.layer.borderColor = UIColor.labelPrimaryColor.cgColor
        self.layer.masksToBounds = true
    }
    
 
}