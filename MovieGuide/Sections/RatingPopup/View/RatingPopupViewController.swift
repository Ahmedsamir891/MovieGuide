//
//  RatingPopupViewController.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation
import UIKit
import Cosmos
class RatingPopupViewController: BaseViewController {
    
    @IBOutlet weak var ratingView: CosmosView!
    
    weak var delegate: RatingPopupViewControllerDelegate?
    //    @IBOutlet weak var placeholderView: UIView!
    
    // MARK: Properties
    
    var movieId: Int?
    var voteAverage: Float?
    
    var presenter: RatingPopupPresentation?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingView.rating = Double(voteAverage.asFloatOrEmpty())
    }
    
    
    @IBAction func didSelectRateButtonAction(){
        presenter?.rateMovieById(movieId.asIntOrEmpty(), rateValue: Float(ratingView.rating))
        
    }
    
    @IBAction func dismissViewController(){
        self.dismissMe()
    }
}

extension RatingPopupViewController: RatingPopupView {
    func didGetSuccessRatingReponse(withRateValue value: String) {
        self.dismiss(animated: true) {
            self.delegate?.didDismissViewContollerWithRatingValue(value)
        }
    }
    
    
    
    // TODO: implement view output methods
}
