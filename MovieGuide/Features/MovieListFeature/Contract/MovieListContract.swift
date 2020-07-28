//
//  BogoModuleContract.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation

protocol MovieListView: ViperView {
    // TODO: Declare view methods
    
    func didGetMoviesListRowModels(rowModels : [BaseRowModel])
    func didGetMoviesListFailureResponse(error text : String)

}

protocol MovieListPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    func viewDidLoad()
    
}

protocol MovieListWireframe: ViperRouter {
    // TODO: Declare wireframe methods
}
