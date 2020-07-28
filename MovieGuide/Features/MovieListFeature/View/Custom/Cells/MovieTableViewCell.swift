//
//  MovieListTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/22/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit
import Kingfisher
class MovieTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var moviePosterImage : UIImageView?
    @IBOutlet weak var movieTitleLabel : UILabel?
    @IBOutlet weak var movieReleaseDateLabel : UILabel?
    @IBOutlet weak var movieRateAverageLabel : UILabel?
    @IBOutlet weak var favoriteButton : UIButton?
    
    var selectedMovie : MoviesList!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func updateCell(rowModel: BaseRowModel) {
        
        
        if let movie = rowModel.rowValue as? MoviesList{
            selectedMovie = movie
            movieTitleLabel?.text = movie.title.asStringOrEmpty()
            movieReleaseDateLabel?.text = UtilityMethods.getFormatedData(dateString: movie.releaseDate.asStringOrEmpty(), sourceFormat: "yyyy-MM-dd", targetFormat: "dd MMM yyyy").dateString
            movieRateAverageLabel?.text = "\(movie.voteAverage.asFloatOrEmpty())"
            
            moviePosterImage?.kf.setImage(with: URL(string: movie.moviePoster))
            
            
            if let savedlist = MovieStateSaver.getMovies(){
                if savedlist.contains(where: {$0.id == movie.id}){
                    favoriteButton?.isSelected = true
                    
                }
                else{
                    favoriteButton?.isSelected = false
                }
            }
        }
    }
    
    
    @IBAction func didSelectFavoriteButtonAction(_ sender : UIButton){
        
        //sender.isSelected = !sender.isSelected
        
        if !sender.isSelected{
            sender.isSelected = true
            selectedMovie.isFavorite = true
            MovieStateSaver.saveMovie(selectedMovie)
            print(MovieStateSaver.getMovies()?.count)
        }
        else{
            sender.isSelected = false
            
            selectedMovie.isFavorite = false
            
            MovieStateSaver.removeMovie(selectedMovie)
            print(MovieStateSaver.getMovies()!)
            
        }
    }
    
    
    
    static func rowModel(model: MoviesList) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        rowModel.delegate = self
        return rowModel
    }
    
}
