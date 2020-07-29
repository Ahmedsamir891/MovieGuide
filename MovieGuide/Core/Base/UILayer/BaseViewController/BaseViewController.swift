//
//  BaseViewController.swift
//  Smiles
//
//  Created by Usman Tarar on 26/02/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - IBOutlets
    
    var dataSource: BaseTableViewDataSource?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - data Source
    
    func setUpTableViewDataSource(dataSource: [BaseRowModel], delegate: BaseDataSourceDelegate?, tableView: UITableView) {
        self.dataSource = BaseTableViewDataSource(dataSource: dataSource, delegate: delegate)
        tableView.dataSource = self.dataSource
        tableView.delegate = self.dataSource
        tableView.reloadData()
    }
    
    func setUpTableViewSectionsDataSource(dataSource: [BaseSectionModel], delegate: BaseDataSourceDelegate?, tableView: UITableView) {
        self.dataSource = BaseTableViewDataSource(dataSourceWithSection: dataSource, delegate: delegate)
        tableView.dataSource = self.dataSource
        tableView.delegate = self.dataSource
        tableView.reloadData()
    }
    
}

extension BaseViewController : BaseDataSourceDelegate{
    
    func didSelectItemInRowModel(rowModel model: BaseRowModel, rowModelValue value: Any, atIndex index: Int) {
        // override in child classes
    }
}
