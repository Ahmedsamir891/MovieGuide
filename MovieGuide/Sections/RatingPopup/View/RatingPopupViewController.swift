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
    
    // MARK: Properties
    
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    @IBOutlet weak var ratingQuestionLabel: UILabel!
    
    @IBOutlet weak var ratingNumberLabel: UILabel!

    
    weak var delegate: RatingPopupViewControllerDelegate?
    
    var movieDetails: MovieBelongsToCollection?
    
    var lastUserRating: String?

    var presenter: RatingPopupPresentation?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewUI()
    }
    
    func setUpViewUI(){
        moviePosterImageView.setImageWithUrlString(movieDetails?.moviePoster, defaultImage: "moviePlaceHolder")
        
        ratingQuestionLabel.text = "How Would you rate \(movieDetails?.name ?? "this movie")?"
        
        ratingView.rating = Double(lastUserRating ?? "0")!
        self.ratingNumberLabel.text = lastUserRating.asStringOrEmpty()
        
        ratingView.didTouchCosmos = { rating in
            self.ratingNumberLabel.text = "\(Int(rating))"
        }

    }
    
    //MARK:-  Button actions
    
    @IBAction func didSelectRateButtonAction(){
        presenter?.rateMovieById(movieDetails?.id.asIntOrEmpty(), rateValue: Float(ratingView.rating))
        
    }
    
    @IBAction func dismissViewController(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension RatingPopupViewController: RatingPopupView {
    func didGetFailureRatingReponse() {
        
         self.dismiss(animated: true) {
           self.delegate?.didDismissViewContollerWithRatingValue("0")

        }
        
    }
    
    func didGetSuccessRatingReponse(withRateValue value: String) {
        self.dismiss(animated: true) {
            self.delegate?.didDismissViewContollerWithRatingValue(value)
        }
    }
    
}
