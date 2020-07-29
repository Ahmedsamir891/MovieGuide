//
//  MovieListTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/22/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit
import Kingfisher


protocol MovieTableViewCellDelegate: class {
    
    func refreshTableView()

    
    
}
class MovieTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var moviePosterImage : UIImageView?
    @IBOutlet weak var movieTitleLabel : UILabel?
    @IBOutlet weak var movieReleaseDateLabel : UILabel?
    @IBOutlet weak var movieRateAverageLabel : UILabel?
    @IBOutlet weak var favoriteButton : UIButton?
    
    weak var cellDetegate: MovieTableViewCellDelegate?
    
    private var selectedMovie : MoviesList!
    private var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func updateCell(rowModel: BaseRowModel) {
        
        
        if var movie = rowModel.rowValue as? MoviesList{
            
            selectedMovie = movie
            
            movieTitleLabel?.text = movie.title.asStringOrEmpty()
            
            movieReleaseDateLabel?.text = UtilityMethods.getFormatedData(dateString: movie.releaseDate.asStringOrEmpty(), sourceFormat: "yyyy-MM-dd", targetFormat: "dd MMM yyyy").dateString
            
            movieRateAverageLabel?.text = "\(movie.voteAverage.asFloatOrEmpty())"
            
            
            moviePosterImage?.setImageWithUrlString(movie.moviePoster, defaultImage: "moviePlaceHolder")
            
            if let delegate = rowModel.delegate as? MovieTableViewCellDelegate {
                self.cellDetegate = delegate
            }
            
            if let selectIndexPath = rowModel.indexPath{
                indexPath = selectIndexPath
            }
            
            if let savedlist = MovieStateSaver.getAllMovies(){
                if savedlist.contains(where: {$0.id == movie.id}){
                    favoriteButton?.isSelected = true
                    movie.isFavorite = true
                    
                }
                else{
                    favoriteButton?.isSelected = false
                    movie.isFavorite = false

                }
            }
        }
    }
    
    
    @IBAction func didSelectFavoriteButtonAction(_ sender : UIButton){
        
        
        if !sender.isSelected{
            sender.isSelected = true
            print(selectedMovie.title!)
            selectedMovie.isFavorite = true
            MovieStateSaver.saveMovie(selectedMovie)
        }
        else{
            sender.isSelected = false
            selectedMovie.isFavorite = false
            MovieStateSaver.removeMovie(selectedMovie)

            if let delegate = cellDetegate{
                delegate.refreshTableView()
            }
            
        }
    }
    
    static func rowModel(model: MoviesList, delegate: MovieTableViewCellDelegate?) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        rowModel.delegate = delegate
        return rowModel
    }
    
}
