//
//  OverViewTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit


class OverViewTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func updateCell(rowModel: BaseRowModel) {
        if let overview = rowModel.rowValue as? String{
            overViewLabel.text = overview
        }
    }
    
    static func rowModel(model: String) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "OverViewTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        
        return rowModel
    }
}
