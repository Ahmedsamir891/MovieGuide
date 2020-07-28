//
//  BaseDataSourceDelegate.swift
//  House
//
//  Created by Ahmed samir ali on 3/10/20.
//  Copyright © 2020 Ahmed samir ali. All rights reserved.
//

import Foundation

protocol BaseDataSourceDelegate : class {
    func didSelectItemInRowModel(rowModel model : BaseRowModel, rowModelValue value: Any, atIndex index : Int)
}
