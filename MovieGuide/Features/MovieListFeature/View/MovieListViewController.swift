//
//  BogoModuleViewController.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
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
        presenter?.viewDidLoad()
        
        setUpViewUI()
    }
    
    //MARK:- helper methods
    
    func setUpViewUI(){
        moviesListTableView.registerCellFromNib(MovieTableViewCell.self, withIdentifier: String(describing: MovieTableViewCell.self))
    }
}

extension MovieListViewController: MovieListView {
    func didGetMoviesListRowModels(rowModels: [BaseRowModel]) {
        setUpTableViewDataSource(dataSource: rowModels, delegate: self, tableView: moviesListTableView)
        
    }
    
    func didGetMoviesListFailureResponse(error text: String) {
        //Show Error
    }
    
    
    
    // TODO: implement view output methods
}
