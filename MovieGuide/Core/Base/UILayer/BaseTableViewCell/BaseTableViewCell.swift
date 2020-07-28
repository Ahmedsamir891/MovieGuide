//
//  BaseTableViewCell.swift
//  Smiles
//
//  Created by Usman Tarar on 26/02/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    weak var delegate: AnyObject?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func updateCell(rowModel: BaseRowModel) {
        preconditionFailure("You have to override updateCell")
    }
}
