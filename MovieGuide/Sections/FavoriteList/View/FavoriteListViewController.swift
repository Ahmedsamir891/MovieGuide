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
    @IBOutlet var errorLabel: UILabel!
    
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
        favoriteMoviesTableView?.registerCellFromNib(MovieTableViewCell.self, withIdentifier: String(describing: MovieTableViewCell.self))
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FavoriteListViewController: FavoriteListView {

    
    func refreshTableView() {
        NotificationCenter.default.post(name: .didRefreshList, object: nil)
        presenter?.viewWillAppear()
    }
    
    func didGetFavoriteMoviesListRowModels(rowModels: [BaseRowModel], delegate: FavoriteListPresenter) {
        
        errorLabel.isHidden = true
        favoriteMoviesTableView.isHidden = false
        setUpTableViewDataSource(dataSource: rowModels, delegate: delegate, tableView: favoriteMoviesTableView)
        
    }
    
    func didGetEmptyFavoriteMoviesList(error text: String) {
        errorLabel.text = text
        errorLabel.isHidden = false
        favoriteMoviesTableView.isHidden = true
    }
    
}
