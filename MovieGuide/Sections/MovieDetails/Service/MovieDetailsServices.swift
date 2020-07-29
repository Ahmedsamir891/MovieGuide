//
//  MovieDetailsServices.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/28/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Alamofire
import Foundation

class MovieDetailsServices {
    
//    let networkManager = networkManager()

    
    let networkManager = NetworkManager()
    
    public func getMovieDetailsById(_ movieId: Int,completionHandler: @escaping (_ moviesDetailsResponse: MovieDetailsResponse) -> (), failureBlock: @escaping (_ error: ErrorCodeConfiguration?) -> ()) {
        
        let movieDetailsRequest = APIRouter.movieDetails(movieId: movieId, movieMoreDetails: "credits,recommendations,similar")
        
        networkManager.executeRequest(for: MovieDetailsResponse.self, movieDetailsRequest, successBlock: { response in
            
            switch response {
            case let .success(list):
                completionHandler(list)
                
            case let .failure(error):
                let errorModel = ErrorCodeConfiguration()
                errorModel.errorCode = (error as NSError).code
                errorModel.errorDescriptionEn = error.localizedDescription
                errorModel.errorDescriptionAr = error.localizedDescription
                failureBlock(errorModel)
            }
            
        }) { error in
            failureBlock(error)
        }
    }
}
