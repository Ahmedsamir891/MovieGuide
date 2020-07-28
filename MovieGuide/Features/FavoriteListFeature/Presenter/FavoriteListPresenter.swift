//
//  BogoModulePresenter.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation

class FavoriteListPresenter {

    // MARK: Properties

    weak var view: FavoriteListView?
    var router: FavoriteListWireframe?
    let services =  FavoriteListServices()
    
   private func getFavoriteMoviesList(){
    
        services.getFavoriteMoviesList { (movies) in
            print(movies.count)
            if !movies.isEmpty{
                self.setUpMoviesListRowModel(moviesList: movies)
            }
            else{
                self.view?.didGetEmptyFavoriteMoviesList(error: "It seems we don’t have anything to show...")

            }
        }
    }
    
    private func setUpMoviesListRowModel(moviesList : [MoviesList]){
           var rowModelItems: [BaseRowModel] = []
           
           moviesList.forEach { (movie) in
               rowModelItems.append(MovieTableViewCell.rowModel(model: movie))
           }
           
           view?.didGetFavoriteMoviesListRowModels(rowModels: rowModelItems)
           
       }
}

extension FavoriteListPresenter: FavoriteListPresentation {
    func viewWillAppear() {
        getFavoriteMoviesList()
    }
    
    // TODO: implement presentation methods
}
