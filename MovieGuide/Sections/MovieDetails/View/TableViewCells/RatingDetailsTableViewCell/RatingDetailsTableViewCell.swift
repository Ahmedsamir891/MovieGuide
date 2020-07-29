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
        if let averageRate = rowModel.rowValue as? Float{
            
            averageRateLabel.text = "\(averageRate)"
            
            if let delegate = rowModel.delegate as? RatingDetailsCellDelegate {
                cellDelegate = delegate
            }
        }
    }
    
    static func rowModel(model: Float, delegate: RatingDetailsCellDelegate) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "RatingDetailsTableViewCell"
         rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        rowModel.delegate = delegate
        return rowModel
    }
    
}
