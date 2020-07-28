//
//  UtilityMethods.swift
//  WeatherTask
//
//  Created by ahmed samir on 3/26/20.
//  Copyright © 2020 ASA. All rights reserved.
//

import Foundation

class UtilityMethods {
    
    static func getFormatedData(dateString date: String, sourceFormat: String, targetFormat: String) -> (dateString : String, date : Date){
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = sourceFormat
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = targetFormat
        dateFormatterPrint.locale = Locale(identifier: "en_US")
        let gregianCal = Calendar(identifier: .gregorian)
        dateFormatterPrint.calendar = gregianCal
        
        
        if let date = dateFormatterGet.date(from: date) {
            return (dateFormatterPrint.string(from: date) , date)
        }
        return ("",Date())
    }
    
    
}
