//
//  MovieDetailsPresenter.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/28/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation

class MovieDetailsPresenter {
    
    // MARK: Properties
    
    weak var view: MovieDetailsView?
    var router: MovieDetailsWireframe?
    let services = MovieDetailsServices()
    
    private var movieId: Int?
    
    var movieDetails : MovieDetailsResponse?
    
    var userRate : String?
    
    //MARK:- Get movies detail
    func getMovieDetailsByIdFromWebService(movieId: Int){
        view?.showLoading()
        
        services.getMovieDetailsById(movieId, completionHandler: { (response) in
            
            self.view?.hideLoading()
            self.movieDetails = response
            
            self.movieId = response.id
            self.setUpMoviesDetailsRowModels(movieDetails: response)
            
        }) { (error) in
            self.view?.hideLoading()
        }
    }
    
    
    func setUpMoviesDetailsRowModels(movieDetails: MovieDetailsResponse){
        
        var rowModels = [BaseRowModel]()
        
        //1st RowModel - Movie Header
        rowModels.append(MovieHeaderDetailsTableViewCell.rowModel(model: MovieHeaderDetails(movieBackPoster: movieDetails.backDropPoster, movieTitleLabel: movieDetails.title, movieReleaseDate: movieDetails.releaseDate)))
        
        //2nd RowModel - Movie Genre
        if let genres = movieDetails.genres, !genres.isEmpty{
            rowModels.append(GenreTableViewCell.rowModel(model: genres))
        }
        
        //3rd RowModel - Rating
        if let voteAverage = movieDetails.voteAverage{
            rowModels.append(RatingDetailsTableViewCell.rowModel(model: RatingDetails(movieRate: voteAverage, userRate: userRate), delegate:self))
        }
        
        
        //4th RowModel - overView
        if let overview = movieDetails.overview{
            rowModels.append(OverViewTableViewCell.rowModel(model: overview))
        }
        
        //5th RowModel - Casting
        if let credits = movieDetails.credits, let cast = credits.cast, !cast.isEmpty{
            rowModels.append(MovieMoreDetailsTableViewCell.rowCastRowModel(model: cast, rowTitle: "Cast"))
        }
        
        
        //5th RowModel - Recommened Movies
        
        if let recommendations = movieDetails.recommendations, let movies = recommendations.sortedMovies, !movies.isEmpty{
            rowModels.append(MovieMoreDetailsTableViewCell.rowMoviesModel(model: movies, rowTitle: "Recommended For You"))
        }
        
        
        //6th RowModel - Samiliar Movies
        
        if let similar = movieDetails.similar, let movies = similar.sortedMovies, !movies.isEmpty{
            rowModels.append(MovieMoreDetailsTableViewCell.rowMoviesModel(model: movies, rowTitle: "Similar Movies"))
            
        }
        
        view?.didGetMovieDetailsRowModels(rowModels: rowModels, delegate: self)
    }
    
}

extension MovieDetailsPresenter: MovieDetailsPresentation {
    
    
    func getMovieDetailsbyId(_ movieId: Int) {
        
        getMovieDetailsByIdFromWebService(movieId: movieId)
    }
    
    
    // TODO: implement presentation methods
}

extension MovieDetailsPresenter: BaseDataSourceDelegate {
    func didSelectItemInRowModel(rowModel model: BaseRowModel, rowModelValue value: Any, atIndex index: Int) {
        
    }
    
}

extension MovieDetailsPresenter: RatingDetailsCellDelegate{
    func didSelectRateButtonActions() {
        
        let ratingPopupViewController = RatingPopupRouter.setupModule()
        ratingPopupViewController.movieDetails = movieDetails?.belongsToCollection
        ratingPopupViewController.lastUserRating = userRate
        ratingPopupViewController.delegate = self
        ratingPopupViewController.modalTransitionStyle = .crossDissolve
        router?.presentModel(viewController: ratingPopupViewController)
        
    }
}

extension MovieDetailsPresenter: RatingPopupViewControllerDelegate{
    
    func didDismissViewContollerWithRatingValue(_ rateValue: String) {
        if let mode = self.movieDetails{
            if rateValue == "0"{
                view?.showAletView(message: "Sorry, we are facing some issue, please try again later")
            }
            else{
                userRate = rateValue
                setUpMoviesDetailsRowModels(movieDetails: mode)
            }
        }
    }
}
