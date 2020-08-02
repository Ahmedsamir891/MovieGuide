//
//  UIApplication.swift
//  Smiles
//
//  Created by Ahmed samir on 16/04/2020.
//  Copyright © 2020 Ahmed samir. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    static func upfrontWindow() -> UIWindow?{
        return UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
    
}
