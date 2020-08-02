//
//  GenreTableViewCell.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import UIKit

class GenreTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    private var baseCollectionViewDataSource : BaseCollectionViewDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 95, height: 30)
        flowLayout.minimumLineSpacing = 10
        genreCollectionView.collectionViewLayout = flowLayout
    }
    
    
    override func updateCell(rowModel: BaseRowModel) {
        if let movieGenres = rowModel.rowValue as? [MovieGenre]{
            
            var collectionItems = [BaseRowModel]()
            
            movieGenres.forEach { (genres) in
                collectionItems.append(GenreCollectionViewCell.rowModel(model: genres))
            }
            
            setUpGenreCollectionView(withRowModel: collectionItems)
        }
    }
    
    static func rowModel(model: [MovieGenre]) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "GenreTableViewCell"
        rowModel.rowHeight = 70
        rowModel.rowValue = model
        return rowModel
    }
    
    
    private func setUpGenreCollectionView(withRowModel rowModels: [BaseRowModel]){
        baseCollectionViewDataSource = BaseCollectionViewDataSource(dataSource: rowModels, delegate: nil)
        
        genreCollectionView.dataSource = baseCollectionViewDataSource
        genreCollectionView.reloadData()
    }
}
