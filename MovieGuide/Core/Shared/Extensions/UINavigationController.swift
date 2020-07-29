//
//  UINavigationController.swift
//  Smiles
//
//  Created by Usman Tarar on 25/03/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

extension UINavigationController {

    func addTabbarItem(title : String, selectedImageName : String , imageName image : String) {
         self.tabBarItem = UITabBarItem()
         self.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
         self.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
         self.tabBarItem.imageInsets =  UIEdgeInsets(top: 10, left: 0, bottom: 6, right: 0)
         self.tabBarItem.title = title
     }
    
    func navigateToViewController(viewController: UIViewController){
        self.pushViewController(viewController, animated: true)
    }
}
