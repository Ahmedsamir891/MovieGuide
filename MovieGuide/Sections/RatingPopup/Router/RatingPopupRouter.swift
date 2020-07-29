//
//  RatingPopupRouter.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation
import UIKit

class RatingPopupRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> RatingPopupViewController {
        let viewController = RatingPopupViewController.instantiate(fromAppStoryboard: .Main)
        let presenter = RatingPopupPresenter()
        let router = RatingPopupRouter()

        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController

        return viewController
    }
}

extension RatingPopupRouter: RatingPopupWireframe {
    // TODO: Implement wireframe methods
}
