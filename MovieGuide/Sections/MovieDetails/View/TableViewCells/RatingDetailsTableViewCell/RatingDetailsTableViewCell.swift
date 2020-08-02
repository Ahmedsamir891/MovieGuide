//
//  RatingDetailsTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit

protocol RatingDetailsCellDelegate: class{
    func didSelectRateButtonActions()
}

struct RatingDetails {
    var movieRate: Float?
    var userRate: String?
}

class RatingDetailsTableViewCell: BaseTableViewCell {
    
    
    @IBOutlet weak var averageRateLabel: UILabel!
    
    
    @IBOutlet weak var rateButton: UIButton!
    
    
    @IBOutlet weak var userRateLabel: UILabel!
    
    weak var cellDelegate: RatingDetailsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func didSelectRateButtonAction(_ sender: UIButton) {
        cellDelegate?.didSelectRateButtonActions()
    }
    
    
    override func updateCell(rowModel: BaseRowModel) {
        if let ratingDetails = rowModel.rowValue as? RatingDetails{
            
            if let userRate = ratingDetails.userRate, !userRate.isEmpty{
                userRateLabel.text = "\(userRate)/10 \n Your rating"
                
                UIView.animate(withDuration: 0.1, animations: {
                    
                    self.userRateLabel.transform = self.transform.scaledBy(x: 1.5, y: 1.5)
                    
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.userRateLabel.transform = CGAffineTransform.identity
                    })
                })
            }
            else{
                userRateLabel.text = "Rate this!"
            }
            
            cellDelegate = rowModel.delegate as? RatingDetailsCellDelegate
            
            averageRateLabel.text = "\(ratingDetails.movieRate.asFloatOrEmpty())/10"
            
            
        }
    }
    
    static func rowModel(model: RatingDetails ,delegate: RatingDetailsCellDelegate?) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "RatingDetailsTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        rowModel.delegate = delegate
        return rowModel
    }
    
}
