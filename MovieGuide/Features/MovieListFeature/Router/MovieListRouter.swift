//
//  BogoModuleRouter.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit

class MovieListRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> MovieListViewController {
        let viewController = MovieListViewController.instantiate(fromAppStoryboard: .Main)
        let presenter = MovieListPresenter()
        let router = MovieListRouter()

        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController

        return viewController
    }
}

extension MovieListRouter: MovieListWireframe {
    // TODO: Implement wireframe methods
}
