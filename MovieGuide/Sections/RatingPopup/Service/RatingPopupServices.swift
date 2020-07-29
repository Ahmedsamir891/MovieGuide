//
//  RatingPopupServices.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Alamofire
import Foundation

class RatingPopupServices {
    
let networkManager = NetworkManager()
   
   public func ceateGuestSession(completionHandler: @escaping (_ guestSessionResponse: GuestSessionResponse) -> (), failureBlock: @escaping (_ error: ErrorCodeConfiguration?) -> ()) {
       
       let createGuestSessionRequest = APIRouter.createGuestSession
       
       networkManager.executeRequest(for: GuestSessionResponse.self, createGuestSessionRequest, successBlock: { response in
           
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
    
    public func rateMovieById(_ id:Int, sessionId: String, rateValue: Float,completionHandler: @escaping (_ ratingMovieResponse: RatingMovieResponse) -> (), failureBlock: @escaping (_ error: ErrorCodeConfiguration?) -> ()) {
          
          let rateMovieRequest = APIRouter.rateMovie(movieId: id, sessionId: sessionId, value: rateValue)
          
          networkManager.executeRequest(for: RatingMovieResponse.self, rateMovieRequest, successBlock: { response in
              
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
