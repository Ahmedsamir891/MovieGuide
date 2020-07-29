//
//  BogoModuleRouter.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit

class FavoriteListRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    // MARK: Static methods
    
    static func setupModule() -> FavoriteListViewController {
        let viewController = FavoriteListViewController.instantiate(fromAppStoryboard: .Main)
        let presenter = FavoriteListPresenter()
        let router = FavoriteListRouter()
        
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        
        return viewController
    }
}

extension FavoriteListRouter: FavoriteListWireframe {
    func navigateToViewController(viewController: UIViewController) {
        view?.navigationController?.navigateToViewController(viewController: viewController)
    }
    
    // TODO: Implement wireframe methods
}
