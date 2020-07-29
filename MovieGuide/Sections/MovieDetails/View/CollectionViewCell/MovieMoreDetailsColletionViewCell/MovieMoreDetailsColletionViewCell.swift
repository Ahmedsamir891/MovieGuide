//
//  MovieMoreDetailsColletionViewCellCollectionViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit

class MovieMoreDetailsColletionViewCell: BaseCollectionViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    override func updateCell(rowModel: BaseRowModel) {
        if let cast = rowModel.rowValue as? MovieCastCrew{
            
            titleLabel.text = cast.name.asStringOrEmpty() + "/" +  cast.character.asStringOrEmpty()
            iconImageView.setImageWithUrlString(cast.profileImageUrl, defaultImage: "castPlaceHolder")
        }
        else if let movie = rowModel.rowValue as? MoviesList{
            
            titleLabel?.text = movie.title.asStringOrEmpty()
            iconImageView.setImageWithUrlString(movie.moviePoster, defaultImage: "moviePlaceHolder")
        }
    }
    
    
    static func rowMovieCastCrewModel(model: MovieCastCrew) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieMoreDetailsColletionViewCell"
        rowModel.rowHeight = 300
        rowModel.rowWidth = 131
        rowModel.rowValue = model
        return rowModel
    }
    
    static func rowMovieModel(model: MoviesList) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieMoreDetailsColletionViewCell"
        rowModel.rowHeight = 300
        rowModel.rowWidth = 131
        rowModel.rowValue = model
        return rowModel
    }
    
    
    
}
