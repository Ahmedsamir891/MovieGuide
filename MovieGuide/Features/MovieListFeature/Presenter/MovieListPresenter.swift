//
//  BogoModulePresenter.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation

class MovieListPresenter {
    
    // MARK: Properties
    
    weak var view: MovieListView?
    var router: MovieListWireframe?
    let services =  MovieListServices()
    
    
    //MARK: - get now playing movie
    
    
    
    private func getNowPlayingMoving(){
     view?.showLoading()

        services.getNowPlayingMovie(page: 1, completionHandler: { (response) in
            self.view?.hideLoading()

            guard let moviesList = response.results else{
                self.view?.didGetMoviesListFailureResponse(error: "It seems we don’t have anything to show...")
                return
            }
            
            self.setUpMoviesListRowModel(moviesList: moviesList)
        }) { (error) in
            self.view?.hideLoading()

            self.view?.didGetMoviesListFailureResponse(error: "We seem to be facing some issues! Please try again later.")

        }
    }
    
    private func setUpMoviesListRowModel(moviesList : [MoviesList]){
        var rowModelItems: [BaseRowModel] = []
        
        moviesList.forEach { (movie) in
            rowModelItems.append(MovieTableViewCell.rowModel(model: movie))
        }
        
        view?.didGetMoviesListRowModels(rowModels: rowModelItems)
        
    }
    
}

extension MovieListPresenter: MovieListPresentation {
    // TODO: implement presentation methods
    
    func viewDidLoad() {
        getNowPlayingMoving()
    }
    
    
    
    
}
