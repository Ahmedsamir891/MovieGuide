//
//  BaseTabBarViewController.swift
//  House
//
//  Created by Ahmed samir ali on 3/19/19.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import UIKit



enum MovieListTabbarItem: String {
    case selectedImage = "nowPlayingTabSelected"
    case unSelectedImage = "nowPlayingTabUnSelected"
    case title = "Now Playing"
    
}

enum FavoriteListTabbarItem: String {
    case selectedImage = "FavTabSelected"
    case unSelectedImage = "FavTabUnselected"
    case title = "Favorites"
    
}


class BaseTabBarViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        tabBar.items![0].customizeTabbatItem(imageName: MovieListTabbarItem.unSelectedImage.rawValue, selectedImageName: MovieListTabbarItem.selectedImage.rawValue, title: MovieListTabbarItem.title.rawValue)
//        
//        
//        tabBar.items![1].customizeTabbatItem(imageName: FavoriteListTabbarItem.unSelectedImage.rawValue, selectedImageName: FavoriteListTabbarItem.selectedImage.rawValue, title: FavoriteListTabbarItem.title.rawValue)
        
        self.tabBar.unselectedItemTintColor = UIColor(named: "PrimaryColor")
        
        self.viewControllers = [setUpMoviesListTabBar(),setUpFavoriteMoviesTabBar()]
    }
    
    func setUpMoviesListTabBar() -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: MovieListRouter.setupModule())
        navigationController.addTabbarItem(title: MovieListTabbarItem.title.rawValue, selectedImageName: MovieListTabbarItem.selectedImage.rawValue, imageName: MovieListTabbarItem.unSelectedImage.rawValue)
        return navigationController
    }
    
    func setUpFavoriteMoviesTabBar() -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: FavoriteListRouter.setupModule())
        navigationController.addTabbarItem(title: FavoriteListTabbarItem.title.rawValue, selectedImageName: FavoriteListTabbarItem.selectedImage.rawValue, imageName: FavoriteListTabbarItem.unSelectedImage.rawValue)
        return navigationController
    }
}

extension UITabBarItem{
    
    func customizeTabbatItem(imageName: String,selectedImageName: String, title: String){
        self.selectedImage = UIImage(named:selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.image = UIImage(named:imageName)?.withRenderingMode(.alwaysOriginal)
        self.title = title
    }
}
