//
//  BogoModuleContract.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit

protocol MovieListView: ViperView {
    
    /// Funcation to return array of row models to populate the table view
    /// - Parameter rowModels: array of table view cell model contain row value, row height, cell identifier, etc...
    func didGetMoviesListRowModels(rowModels : [BaseRowModel], delegate: MovieListPresenter)
    
    
    /// Function to return 
    /// - Parameter text: return error text
    func didGetMoviesListFailureResponse(error text : String)
    
}

protocol MovieListPresentation: ViperPresenter {
    
    func viewDidLoad()
    
}

protocol MovieListWireframe: ViperRouter{
    
    func navigateToViewController(viewController: UIViewController)
}
