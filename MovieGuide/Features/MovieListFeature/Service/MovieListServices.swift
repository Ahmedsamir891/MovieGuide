//
//  BogoModuleServices.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

//import Alamofire
import Foundation

class MovieListServices{
    
    let networkManager = NetworkManager()

    public func getNowPlayingMovie(page: Int,completionHandler: @escaping (_ moviesListResponse: MoviesListResponse) -> (), failureBlock: @escaping (_ error: ErrorCodeConfiguration?) -> ()) {
           let getNowPlayingMovieRequest = APIRouter.nowPlaying(page: page)
           
           networkManager.executeRequest(for: MoviesListResponse.self, getNowPlayingMovieRequest, successBlock: { response in
               
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
