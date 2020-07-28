//
//  Reachability.swift
//  Smiles
//
//  Created by Usman Tarar on 21/05/2020.
//  Copyright © 2020 systems. All rights reserved.
//

import Foundation
import Alamofire

class Reachability {
    
//shared instance
static let shared = Reachability()
    
    static var isReachable : Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }

let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")

    func startNetworkReachabilityObserver() {

        self.reachabilityManager?.startListening { status in
            switch status {
                case .notReachable:
                    print("The network is not reachable")

                case .unknown :
                    print("It is unknown whether the network is reachable")
                
                case .reachable(.ethernetOrWiFi):
                    print("The network is reachable over the WiFi connection")

                case .reachable(.cellular):
                    print("The network is reachable over the cellular connection")
            }
        }
   }
}
