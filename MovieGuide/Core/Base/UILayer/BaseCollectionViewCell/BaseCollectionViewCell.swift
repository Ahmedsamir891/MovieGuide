//
//  BaseCollectionViewCell.swift
//  Smiles
//
//  Created by Usman Tarar on 29/05/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    
    func updateCell(rowModel: BaseRowModel) {
        preconditionFailure("You have to override updateCell")
    }
    

    

}
