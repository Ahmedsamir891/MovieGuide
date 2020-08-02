//
//  ViperView.swift
//  Smiles
//
//  Created by Usman Tarar on 16/09/2020.
//  Copyright © 2020 UsmanTarar. All rights reserved.
//

import UIKit
import Foundation

protocol ViperView: class {
    func showLoading()
    func hideLoading()
    
    func showAletView(message: String)
    
}

extension ViperView where Self: BaseViewController {
    func showLoading() {
        ProgressIndicator.shared().show()
    }
    
    func hideLoading() {
        ProgressIndicator.shared().hide()
    }
    
    func showAletView(message: String){
        showAlertWith(message: message)
    }
}
