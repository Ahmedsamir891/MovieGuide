//
//  CastingTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit

class MovieMoreDetailsTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var movieMoreDetailsCollectionView: UICollectionView!
    
    
    private var baseCollectionViewDataSource : BaseCollectionViewDataSource!
    
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 120, height: 230)
        flowLayout.minimumLineSpacing = 10
        movieMoreDetailsCollectionView.collectionViewLayout = flowLayout
    }
    
    
    
    override func updateCell(rowModel: BaseRowModel) {
        
        if let movieCastCrew = rowModel.rowValue as? [MovieCastCrew]{
            var collectionItems: [BaseRowModel] = []
            
            sectionTitle.text = rowModel.rowTitle
            
            movieCastCrew.forEach { (cast) in
                collectionItems.append(MovieMoreDetailsColletionViewCell.rowMovieCastCrewModel(model: cast))
            }
            setUpGenreCollectionView(withRowModel: collectionItems)
            
        }
        else if let movieList = rowModel.rowValue as? [MoviesList]{
            
            sectionTitle.text = rowModel.rowTitle

            var collectionItems: [BaseRowModel] = []
            
            movieList.forEach { (movie) in
                collectionItems.append(MovieMoreDetailsColletionViewCell.rowMovieModel(model: movie))
                
            }
            setUpGenreCollectionView(withRowModel: collectionItems)
            
        }
    }
    
    static func rowCastRowModel(model: [MovieCastCrew], rowTitle: String) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieMoreDetailsTableViewCell"
        rowModel.rowValue = model
        rowModel.rowTitle = rowTitle
        rowModel.rowHeight = 250
        return rowModel
    }
    
    
    static func rowMoviesModel(model: [MoviesList], rowTitle: String) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "MovieMoreDetailsTableViewCell"
        rowModel.rowValue = model
        rowModel.rowTitle = rowTitle
        rowModel.rowHeight = 250
        return rowModel
    }
    
    
    private func setUpGenreCollectionView(withRowModel rowModels: [BaseRowModel]){
        baseCollectionViewDataSource = BaseCollectionViewDataSource(dataSource: rowModels, delegate: nil)
        
        movieMoreDetailsCollectionView.dataSource = baseCollectionViewDataSource
        movieMoreDetailsCollectionView.reloadData()
    }
}
