//
//  MovieDetailsViewController.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/28/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet var movieDetailsTableView: UITableView!
    
    var movieId: Int?


    var presenter: MovieDetailsPresentation?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getMovieDetailsbyId(movieId.asIntOrEmpty())

    }
}

extension MovieDetailsViewController: MovieDetailsView {
    func didGetMovieDetailsRowModels(rowModels: [BaseRowModel], delegate: MovieDetailsPresenter) {
        setUpTableViewDataSource(dataSource: rowModels, delegate: delegate, tableView: movieDetailsTableView)
    }
    
    // TODO: implement view output methods
}
