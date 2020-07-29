//
//  BaseTableViewDataSource.swift
//  GenericTableView-etisalat
//
//  Created by Usman Tarar on 01/03/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Var
    
    var tableViewItems: [BaseRowModel] = []
    var tableViewSectionItems: [BaseSectionModel] = []
    var dataSourceDelegate: BaseDataSourceDelegate?
    
    // MARK: - Methods
    
    init(dataSource: [BaseRowModel]?, delegate: BaseDataSourceDelegate?) {
        if let object = dataSource {
            tableViewItems = object
            dataSourceDelegate = delegate
        }
        super.init()
    }
    
    
    
    init(dataSourceWithSection: [BaseSectionModel]?, delegate: BaseDataSourceDelegate?) {
        if let object = dataSourceWithSection {
            tableViewSectionItems = object
            dataSourceDelegate = delegate
        }
        super.init()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewSectionItems.count > 0 {
            let item = tableViewSectionItems[indexPath.section].rowItems[indexPath.row]
            let itemValue = item.rowValue
            dataSourceDelegate?.didSelectItemInRowModel(rowModel: item, rowModelValue: itemValue as Any, atIndex: indexPath.row)
        } else {
            let item = tableViewItems[indexPath.row]
            let itemValue = item.rowValue
            dataSourceDelegate?.didSelectItemInRowModel(rowModel: item, rowModelValue: itemValue as Any, atIndex: indexPath.row)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = tableViewSectionItems[section].sectionView {
            return view
        } else {
            return UIView()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSectionItems.count > 0 ? tableViewSectionItems.count : 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewSectionItems.count > 0 ? tableViewSectionItems[section].sectionHeight : CGFloat.zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewSectionItems.count > 0 {
            return tableViewSectionItems[section].rowItems.count
        } else {
            return tableViewItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableViewSectionItems.count > 0 {
            let item = tableViewSectionItems[indexPath.section].rowItems[indexPath.row]
            return item.rowHeight
        } else {
            let item = tableViewItems[indexPath.row]
            return item.rowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: BaseRowModel = BaseRowModel()
                item.indexPath = indexPath

        if tableViewSectionItems.count > 0 {
            item = tableViewSectionItems[indexPath.section].rowItems[indexPath.row]
        } else {
            item = tableViewItems[indexPath.row]
        }
        
        // Check Storyboard cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.rowCellIdentifier) as? BaseTableViewCell {
            cell.updateCell(rowModel: item)
            return cell
        }
        
        // Check Nib cell
        if let cellFromNib = tableView.dequeueReusableCell(withIdentifier: item.rowCellIdentifier, for: indexPath) as? BaseTableViewCell {
            cellFromNib.updateCell(rowModel: item)
            return cellFromNib
        }
        
        return UITableViewCell()
    }
}
