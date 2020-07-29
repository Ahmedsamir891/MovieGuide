//
//  GuestSessionSaver.swift
//  MovieGuide
//
//  Created by ahmed samir on 7/29/20.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation



struct SessionStateSaver {
    
    public static func saveSession(_ session : GuestSessionResponse){
       UserDefaults.standard.set(try! PropertyListEncoder().encode(session), forKey: "session")
    }
    

    
    public static func getSession() -> GuestSessionResponse?{
        if let session = UserDefaults.standard.data(forKey: "session"){
            return try! PropertyListDecoder().decode(GuestSessionResponse.self, from: session)
        }
        return nil
    }
    
    
    public static func removeSession(){
        UserDefaults.standard.removeObject(forKey: "session")
    }
}
