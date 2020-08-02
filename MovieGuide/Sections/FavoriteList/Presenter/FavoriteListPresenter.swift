//
//  BogoModulePresenter.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit
class FavoriteListPresenter {
    
    // MARK: Properties
    
    weak var view: FavoriteListView?
    var router: FavoriteListWireframe?
    let services =  FavoriteListServices()
    
    private func getFavoriteMoviesList(){
        
        services.getFavoriteMoviesList { (movies) in
            if !movies.isEmpty{
                self.setUpMoviesListRowModel(moviesList: movies)
            }
            else{
                self.view?.didGetEmptyFavoriteMoviesList(error: "It seems we don’t have anything to show \n Start add movies to favorites")
                
            }
        }
    }
    
    private func setUpMoviesListRowModel(moviesList : [MoviesList]){
        var rowModelItems: [BaseRowModel] = []
        
        moviesList.forEach { (movie) in
            rowModelItems.append(MovieTableViewCell.rowModel(model: movie, delegate: self))
        }
        
        view?.didGetFavoriteMoviesListRowModels(rowModels: rowModelItems, delegate: self)
        
    }
    
    //MARK:- Navigation
    
    /// Navigate to movie details
    /// - Parameter movieId: int to pass to movie details viewController
    private func navigateToMovieDetailsViewController(moiveList: MoviesList){
        
        let movieDetailsViewController = MovieDetailsRouter.setupModule()
        movieDetailsViewController.movieId = moiveList.id
        router?.navigateToViewController(viewController: movieDetailsViewController)
    }
}

extension FavoriteListPresenter: FavoriteListPresentation {
    
    func viewWillAppear() {
        getFavoriteMoviesList()
    }
    
}

extension FavoriteListPresenter: BaseDataSourceDelegate{
    
    
    /// Delegate mehtod which responsible for DidSelectRow of tableView
    /// - Parameters:
    ///   - model: RowModel of SelectRoW
    ///   - value: RowValue of SelectedRow [MovieList]
    ///   - index: Row index
    func didSelectItemInRowModel(rowModel model: BaseRowModel, rowModelValue value: Any, atIndex index: Int) {
        if let movie = value as? MoviesList{

            navigateToMovieDetailsViewController(moiveList: movie)
        }
    }
}


extension FavoriteListPresenter: MovieTableViewCellDelegate{
    func refreshTableView() {
        view?.refreshTableView()
    }
}
