//
//  BaseRowModel.swift
//  Smiles
//
//  Created by Usman Tarar on 30/04/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseRowModel: NSObject {
    // Row Item
    var rowCellIdentifier = ""
    var rowValue: Any?
    var rowTitle: String = ""
    var rowHeight: CGFloat = 0.0
    var rowWidth: CGFloat = 0.0
    var indexPath: IndexPath?
    var delegate: Any?
}

class BaseSectionModel: NSObject {
    
    var sectionCellIdentifier = ""
    var rowItems: [BaseRowModel] = []
    var sectionTitle: String = ""
    var sectionHeight: CGFloat = 0.0
    var delegate: Any?
    var sectionView: UIView?
}
