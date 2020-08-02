//
//  GenreCollectionViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var genreLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func updateCell(rowModel: BaseRowModel) {
        if let genre = rowModel.rowValue as? MovieGenre{
            genreLabel.text = genre.name.asStringOrEmpty()
        }
    }
    
    
    class func rowModel(model: MovieGenre) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "GenreCollectionViewCell"
        rowModel.rowValue = model
        return rowModel
    }
    
}
