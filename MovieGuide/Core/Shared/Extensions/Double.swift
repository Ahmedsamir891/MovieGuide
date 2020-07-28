//
//  Double.swift
//  Smiles
//
//  Created by Khawar Shazad on 07/04/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit
import Foundation

extension Double{
    func integerPart()->String {
        let result = floor(self).description.dropLast(2).description
        return result
    }
    func fractionalPart(_ withDecimalQty:Int = 2)->String {
        let valDecimal = self.truncatingRemainder(dividingBy: 1)
        let formatted = String(format: "%.\(withDecimalQty)f", valDecimal)
        return formatted.dropFirst(2).description
    }
    
    func getDateStringFromTimestamp() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
