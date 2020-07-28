//
//  UIApplication.swift
//  Smiles
//
//  Created by Usman Tarar on 16/04/2020.
//  Copyright © 2020 Systems. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
   
    static func openAppSettings(completion: @escaping (_ isSuccess: Bool) -> ()) {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            completion(false)
            return
        }

        let app = UIApplication.shared

        app.open(url) { isSuccess in
            completion(isSuccess)
        }
    }

    static func openPhoneSettings(completion: @escaping (_ isSuccess: Bool) -> ()) {
        guard let url = URL(string: "App-Prefs:root=General") else {
            completion(false)
            return
        }

        let app = UIApplication.shared

        app.open(url) { isSuccess in
            completion(isSuccess)
        }
    }
    
    static func upfrontWindow() -> UIWindow?{
        return UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
    
}
