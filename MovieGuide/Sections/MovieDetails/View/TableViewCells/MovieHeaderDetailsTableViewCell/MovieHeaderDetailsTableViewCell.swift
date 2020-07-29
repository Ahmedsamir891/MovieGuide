//
//  MovieHeaderDetailsTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit

struct MovieHeaderDetails {
    let movieBackPoster: String?
    let movieTitleLabel: String?
    let movieReleaseDate: String?
    
}

class MovieHeaderDetailsTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    private var selectedMovie: MoviesList?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func updateCell(rowModel: BaseRowModel) {
        if let headerDetails = rowModel.rowValue as? MovieHeaderDetails{
            
            titleLabel?.text = headerDetails.movieTitleLabel.asStringOrEmpty()
            
            releaseDateLabel?.text = UtilityMethods.getFormatedData(dateString: headerDetails.movieReleaseDate.asStringOrEmpty(), sourceFormat: "yyyy-MM-dd", targetFormat: "dd MMM yyyy").dateString
            
            posterImageView?.kf.setImage(with: URL(string: headerDetails.movieBackPoster.asStringOrEmpty()))
        }
    }
    

    
    static func rowModel(model: MovieHeaderDetails) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieHeaderDetailsTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        return rowModel
    }
}
