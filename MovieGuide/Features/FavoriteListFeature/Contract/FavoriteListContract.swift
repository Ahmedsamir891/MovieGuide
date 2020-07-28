//
//  BogoModuleContract.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation

protocol FavoriteListView: ViperView {
    // TODO: Declare view methods
    func didGetFavoriteMoviesListRowModels(rowModels : [BaseRowModel])
    func didGetEmptyFavoriteMoviesList(error text : String)
}

protocol FavoriteListPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    func viewWillAppear()
}

protocol FavoriteListWireframe: ViperRouter {
    // TODO: Declare wireframe methods
}
