//
//  ArrayExtension.swift
//  House
//
//  Created by Ahmed samir ali on 7/10/19.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import Foundation

 extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func removeElement(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }

}
