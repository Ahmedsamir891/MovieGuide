//
//  BogoModuleServices.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

//import Alamofire
import Foundation

class FavoriteListServices : NSObject{
    
    
    func getFavoriteMoviesList(completionHandler: @escaping (_ moviesList: [MoviesList]) -> ()){
        if let moviesList = MovieStateSaver.getMovies(){
            completionHandler(moviesList)
        }
    }
//    func executePostBogoModuleRequest(value1: String, value2: String, completionHandler: @escaping (DataResponse<BogoModuleResponseModel>) -> ()) {
//        let action = "EndPoints.HOME ...."
//        parameters = ["key1": value1, "key2": value2] as [String: AnyObject]
//
//        executePost(action: action) { (handler: DataResponse<BogoModuleResponseModel>) in
//            completionHandler(handler)
//        }
//    }
}
