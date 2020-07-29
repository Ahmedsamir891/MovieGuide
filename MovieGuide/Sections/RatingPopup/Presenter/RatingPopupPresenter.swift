//
//  RatingPopupPresenter.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation

class RatingPopupPresenter {
    
    // MARK: Properties
    
    weak var view: RatingPopupView?
    var router: RatingPopupWireframe?
    let services = RatingPopupServices()
    
    
    
    private func createSessionFromWebService(movieId: Int, rateValue:Float){
        if let session = SessionStateSaver.getSession(){
            
            rateMovideByIdFromWebService(movieId, sessionId: session.guestSessionId.asStringOrEmpty(), rateValue: rateValue)
        }
        else{
            services.ceateGuestSession(completionHandler: { (response) in
                
                if let success = response.success, success{
                    
                    SessionStateSaver.saveSession(response)
                    
                    self.rateMovideByIdFromWebService(movieId, sessionId: response.guestSessionId.asStringOrEmpty(), rateValue: rateValue)
                }
                
            }) { (error) in
                
            }
        }
    }
    
    
    func rateMovideByIdFromWebService(_ movieId: Int, sessionId: String, rateValue: Float){
        self.services.rateMovieById(movieId, sessionId: sessionId, rateValue: rateValue, completionHandler: { (rateReponse) in
            
            if let statusCode = rateReponse.statusCode, statusCode == 1{
                self.view?.didGetSuccessRatingReponse(withRateValue: "\(rateValue)")
            }
        }) { (error) in
            
        }
    }
}

extension RatingPopupPresenter: RatingPopupPresentation {
    // TODO: implement presentation methods
    
    func rateMovieById(_ movidId: Int, rateValue: Float){
        createSessionFromWebService(movieId: movidId, rateValue: rateValue)
    }
}
