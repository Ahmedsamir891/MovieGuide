//
//  MovieListViewController.swift
//  Movie guide
//
//  Created by Ahmed samir on 27/07/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit


class MovieListViewController: BaseViewController {
    
    @IBOutlet var moviesListTableView: UITableView!
    
    // MARK: Properties
    
    var presenter: MovieListPresentation?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewUI()
        DispatchQueue.main.async {
            self.presenter?.viewDidLoad()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshMovieList), name: .didRefreshList, object: nil)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    //MARK:- helper methods
    
    func setUpViewUI(){
        moviesListTableView.registerCellFromNib(MovieTableViewCell.self, withIdentifier: String(describing: MovieTableViewCell.self))
    }
    
    //MARK:- Observer
    
    @objc func refreshMovieList(){
        moviesListTableView.reloadData()
    }
    
    
}

extension MovieListViewController: MovieListView {
    
    func didGetMoviesListRowModels(rowModels: [BaseRowModel], delegate: MovieListPresenter) {
        setUpTableViewDataSource(dataSource: rowModels, delegate: delegate, tableView: moviesListTableView)
    }
    
    func didGetMoviesListFailureResponse(error text: String) {
        //Show Error
    }
    
}
