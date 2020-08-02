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
    
    /// Check guest session if it is expired or not
    private func  checkSessionValidity() -> GuestSessionResponse?{
        if let session = SessionStateSaver.getSession(){
            
            let sessionExpiryDate = UtilityMethods.getFormatedData(dateString: session.expiresAt.asStringOrEmpty(), sourceFormat: "yyyy-MM-dd HH:mm:ss Z", targetFormat: "yyyy-MM-dd H:mm:ss").date
            
            if  sessionExpiryDate.isInPast{
                return nil
            }
            else{
                return session
            }
        }
        return nil
    }
    
    
    
    /// Check if session is valid and not expired, then get session from user default else create guest session from web service
    
    /// - Parameters:
    ///   - movieId: id used to rate movie
    ///   - rateValue: movie rate to pass to webservice
    func getGuestSessionFromWebService(movieId: Int, rateValue:Float){
        
        
        view?.showLoading()
        
        if let validSession = checkSessionValidity(){
            self.rateMovideByIdFromWebService(movieId, sessionId: validSession.guestSessionId.asStringOrEmpty(), rateValue: rateValue)
        }
        else{
            services.ceateGuestSession(completionHandler: { (response) in
                
                if let success = response.success, success{
                    
                    SessionStateSaver.saveSession(response)
                    
                    self.rateMovideByIdFromWebService(movieId, sessionId: response.guestSessionId.asStringOrEmpty(), rateValue: rateValue)
                }
                
            }) { (error) in
                self.view?.hideLoading()
                self.view?.didGetFailureRatingReponse()
            }
        }
    }
    
    
    func rateMovideByIdFromWebService(_ movieId: Int, sessionId: String, rateValue: Float){
        self.services.rateMovieById(movieId, sessionId: sessionId, rateValue: rateValue, completionHandler: { (rateReponse) in
            
            self.view?.hideLoading()
            self.view?.didGetSuccessRatingReponse(withRateValue: "\(Int(rateValue))")
            
        }) { (error) in
            self.view?.hideLoading()
            self.view?.didGetFailureRatingReponse()
            
        }
    }
}

extension RatingPopupPresenter: RatingPopupPresentation {
    
    func rateMovieById(_ movidId: Int?, rateValue: Float){
        getGuestSessionFromWebService(movieId: movidId.asIntOrEmpty(), rateValue: rateValue)
    }
}
