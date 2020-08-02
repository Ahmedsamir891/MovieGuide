//
//  NetworkManager.swift
//  House
//
//  Created by Ahmed samir ali on 1/15/19.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import Foundation
import Alamofire


enum ServiceResult<T> {
    case success(T)
    case failure(Error)
}


class NetworkManager  {
    
    private var manager: Session!
    
    init(requestTimeout : Double = 60) {
        manager = self.getAlamofireManager(timeout: requestTimeout)
    }
    
    private func getAlamofireManager(timeout : Double) -> Session  {
        
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.allowsCellularAccess = false
        
        manager = Session(configuration: configuration)
        
        return manager
    }
    
    
    public final func executeRequest<T: Codable> (for: T.Type = T.self ,_ requestIdentifier: URLRequestConvertible?, successBlock: @escaping (ServiceResult<T>) -> (), failureBlock: @escaping (_ error: ErrorCodeConfiguration?) -> ())
    {
        if NetworkReachabilityManager.default?.status == .notReachable  {
            
            let errorModel = ErrorCodeConfiguration()
            errorModel.errorDescriptionEn = "No internet connection"
            failureBlock(errorModel)
            return
        }
        else{
            
            self.manager.request(requestIdentifier!).responseJSON { (response) in
                
                if NetworkReachabilityManager.default?.status == .notReachable {
                    
                    let errorModel = ErrorCodeConfiguration()
                    errorModel.errorDescriptionEn = "No internet connection"
                    failureBlock(errorModel)
                    return
                }
                
                if NetworkReachabilityManager.default?.status == .unknown{
                    
                    let errorModel = ErrorCodeConfiguration()
                    errorModel.errorDescriptionEn = "Something went wrong!"
                    failureBlock(errorModel)
                    return
                }
                print()
                
                //                switch response.response?.status {
                //
                //                }
                
                if response.response?.status != .success
                {
                    let errorModel = ErrorCodeConfiguration()
                    errorModel.errorDescriptionEn = "Something went wrong!"
                    failureBlock(errorModel)
                    return;
                }
                
                switch response.result {
                case .success :
                    let decoder = JSONDecoder()
                    try? successBlock(.success(decoder.decode(T.self, from: response.data!)))
                    break
                    
                case .failure(let error):
                    let errorModel = ErrorCodeConfiguration()
                    errorModel.errorCode = (error as NSError).code
                    errorModel.errorDescriptionEn = error.localizedDescription
                    errorModel.errorDescriptionAr = error.localizedDescription
                    
                    failureBlock (errorModel)
                    break
                }
            }
        }
    }
}

extension HTTPURLResponse {
    
    var status: HTTPStatusCode.ResponseType? {
        return HTTPStatusCode(rawValue: statusCode)?.responseType
    }
    
    //    var responseType: HTTPStatusCode.ResponseType? {
    //        return HTTPStatusCode(rawValue: statusCode)
    //       }
    
}
