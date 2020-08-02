//
//  ImageExtension.swift
//  House
//
//  Created by Ahmed samir ali on 3/25/19.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func makeRounded(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    

       
       func setImageWithUrlString(_ urlString: String?, defaultImage: String? = "") {
           if let url = urlString, let imageURL = URL(string: url) {
               self.kf.setImage(with: imageURL)
           }
           else{
               self.image = UIImage(named: defaultImage ?? "")
           }
       }
   
}
