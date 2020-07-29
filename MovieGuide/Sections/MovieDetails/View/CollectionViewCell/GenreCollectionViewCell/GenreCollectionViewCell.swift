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
        self.contentView.styleView(borderColor: UIColor(named: "PrimaryColor")!, borderWitdh: 1.0, cornerRadius: 10.0)
    }
    
    override func updateCell(rowModel: BaseRowModel) {
        if let genre = rowModel.rowValue as? MovieGenre{
            genreLabel.text = genre.name.asStringOrEmpty()
        }
    }
    
    
    class func rowModel(model: MovieGenre) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "GenreCollectionViewCell"
        rowModel.rowHeight = 29
        rowModel.rowWidth = 80
        rowModel.rowValue = model
        return rowModel
    }
    
}
