//
//  RatingPopupContract.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation

protocol RatingPopupView: ViperView {
    // TODO: Declare view methods
    
    func didGetSuccessRatingReponse(withRateValue value: String)
}

protocol RatingPopupPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    
    func rateMovieById(_ movidId: Int, rateValue: Float)
}

protocol RatingPopupWireframe: ViperRouter {
    // TODO: Declare wireframe methods
}


protocol RatingPopupViewControllerDelegate: class {
    // TODO: Declare wireframe methods
    func didDismissViewContollerWithRatingValue(_ rateValue: String)
}
