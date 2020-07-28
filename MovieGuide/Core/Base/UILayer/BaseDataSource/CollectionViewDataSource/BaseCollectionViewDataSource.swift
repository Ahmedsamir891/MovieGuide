//
//  BaseCollectionViewDataSource.swift
//  WeatherTask
//
//  Created by ahmed samir on 3/27/20.
//  Copyright © 2020 ASA. All rights reserved.
//

import UIKit

class BaseCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var collectionViewItems: [BaseRowModel] = []
    var collectionSectionItems: [BaseSectionModel] = []
    var dataSourceDelegate: BaseDataSourceDelegate?
    
    // MARK: - Methods
    
    init(dataSource: [BaseRowModel]?, delegate: BaseDataSourceDelegate?) {
        if let object = dataSource {
            collectionViewItems = object
            dataSourceDelegate = delegate
        }
        super.init()
    }
    
    
    
    init(dataSourceWithSection: [BaseSectionModel]?, delegate: BaseDataSourceDelegate) {
        if let object = dataSourceWithSection {
            collectionSectionItems = object
            dataSourceDelegate = delegate
        }
        super.init()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionSectionItems.count > 0 ? collectionSectionItems.count : 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionSectionItems.count > 0 {
            return collectionSectionItems[section].rowItems.count
        } else {
            return collectionViewItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item: BaseRowModel = BaseRowModel()

        if collectionSectionItems.count > 0 {
            item = collectionSectionItems[indexPath.section].rowItems[indexPath.row]
        } else {
            item = collectionViewItems[indexPath.row]
        }
        
        // Check Storyboard cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.rowCellIdentifier, for: indexPath) as? BaseCollectionViewCell {
            cell.updateCell(rowModel: item)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

extension BaseCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = collectionViewItems[indexPath.row]
        return CGSize(width: item.rowWidth, height: item.rowHeight)
    }
}
