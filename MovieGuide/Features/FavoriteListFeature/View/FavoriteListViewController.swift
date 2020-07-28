//
//  BogoModuleViewController.swift
//  Smiles
//
//  Created by Usman Tarar on 04/06/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import UIKit

class FavoriteListViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet var favoriteMoviesTableView: UITableView!

    var presenter: FavoriteListPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewWillAppear()
    }
    func setUpViewUI(){
           favoriteMoviesTableView.registerCellFromNib(MovieTableViewCell.self, withIdentifier: String(describing: MovieTableViewCell.self))
       }
}

extension FavoriteListViewController: FavoriteListView {
    func didGetFavoriteMoviesListRowModels(rowModels: [BaseRowModel]) {
        setUpTableViewDataSource(dataSource: rowModels, delegate: self, tableView: favoriteMoviesTableView)

    }
    
    func didGetEmptyFavoriteMoviesList(error text: String) {
        
    }
    

    
  
    
    // TODO: implement view output methods
}
