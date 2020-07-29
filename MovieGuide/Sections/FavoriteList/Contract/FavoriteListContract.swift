//
//  BogoModuleContract.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit
protocol FavoriteListView: ViperView {

    func didGetFavoriteMoviesListRowModels(rowModels : [BaseRowModel], delegate: FavoriteListPresenter)
    func didGetEmptyFavoriteMoviesList(error text : String)
    
    func refreshTableView()
}

protocol FavoriteListPresentation: ViperPresenter {
    func viewWillAppear()
}

protocol FavoriteListWireframe: ViperRouter {
    func navigateToViewController(viewController: UIViewController)
}
