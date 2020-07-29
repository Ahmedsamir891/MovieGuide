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
    
    
    
    /// Get now playing movies from WebService
    
    private func getNowPlayingMovingFromWebService(){
        view?.showLoading()
        
        services.getNowPlayingMovie(page: 1, completionHandler: { (response) in
            self.view?.hideLoading()
            
            guard let moviesList = response.sortedMovies else{
                self.view?.didGetMoviesListFailureResponse(error: "It seems we don’t have anything to show...")
                return
            }
            
            self.setUpMoviesListRowModel(moviesList: moviesList)
        }) { (error) in
            self.view?.hideLoading()
            self.view?.didGetMoviesListFailureResponse(error: "We seem to be facing some issues! Please try again later.")
        }
    }
    
    
    //MARK:- Set Up row models
    /// SetUp Table view cell Row model(rowMode, rowHeight, cellIdentifier,etc)
    /// - Parameter moviesList: array of Table view data source
    private func setUpMoviesListRowModel(moviesList : [MoviesList]){
        var rowModelItems: [BaseRowModel] = []
        
        moviesList.forEach { (movie) in
            rowModelItems.append(MovieTableViewCell.rowModel(model: movie, delegate: nil))
        }
        
        view?.didGetMoviesListRowModels(rowModels: rowModelItems, delegate: self)
    }
    
    //MARK:- Navigation
    
    /// Navigate to movie details
    /// - Parameter movieId: int to pass to movie details viewController
    private func navigateToMovieDetailsViewController(movieId: Int?, isFavoriteMovie: Bool){
        
        let movieDetailsViewController = MovieDetailsRouter.setupModule()
        movieDetailsViewController.movieId = movieId
        router?.navigateToViewController(viewController: movieDetailsViewController)
    }
}

extension MovieListPresenter: MovieListPresentation {
    
    
    /// Call method in ViewDidLoad
    func viewDidLoad() {
        getNowPlayingMovingFromWebService()
    }
}

extension MovieListPresenter: BaseDataSourceDelegate{
    
    
    /// Delegate mehtod which responsible for DidSelectRow of tableView
    /// - Parameters:
    ///   - model: RowModel of SelectRoW
    ///   - value: RowValue of SelectedRow [MovieList]
    ///   - index: Row index
    func didSelectItemInRowModel(rowModel model: BaseRowModel, rowModelValue value: Any, atIndex index: Int) {
        if let movie = value as? MoviesList{
            navigateToMovieDetailsViewController(movieId: movie.id, isFavoriteMovie: movie.isFavorite.asBoolOrFalse())
        }
    }
}

