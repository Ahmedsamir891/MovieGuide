//
//  MovieDetailsContract.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/28/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation
import UIKit
protocol MovieDetailsView: ViperView {
    func didGetMovieDetailsRowModels(rowModels : [BaseRowModel], delegate: MovieDetailsPresenter)
    
}

protocol MovieDetailsPresentation: ViperPresenter {
    
    func getMovieDetailsbyId(_ movieId: Int)
}

protocol MovieDetailsWireframe: ViperRouter {
    
    func presentModel(viewController: UIViewController)
}
