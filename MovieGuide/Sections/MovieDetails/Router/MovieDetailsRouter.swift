//
//  MovieDetailsRouter.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/28/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    // MARK: Static methods
    
    static func setupModule() -> MovieDetailsViewController {
        let viewController = MovieDetailsViewController.instantiate(fromAppStoryboard: .Main)
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()
        
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        
        return viewController
    }
}

extension MovieDetailsRouter: MovieDetailsWireframe {
    func presentModel(viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        view?.tabBarController?.present(viewController, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
