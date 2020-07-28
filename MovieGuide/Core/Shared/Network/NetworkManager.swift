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
        
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 60
//        let delegate = Session.default.delegate


//        let manager = Session(configuration: configuration, delegate: delegate, startRequestsImmediately: false, cachedResponseHandler: nil)
        let configuration = URLSessionConfiguration.af.default
        configuration.allowsCellularAccess = false

         manager = Session(configuration: configuration)
        
//        let rootQueue = DispatchQueue(label: "org.alamofire.customQueue")
//        let queue = OperationQueue()
//        queue.maxConcurrentOperationCount = 1
//        queue.underlyingQueue = rootQueue
//        let delegate = SessionDelegate()
//        let configuration = URLSessionConfiguration.af.default
//        let urlSession = URLSession(configuration: configuration,
//                                    delegate: delegate,
//                                    delegateQueue: queue)
//        manager = Session(session: urlSession, delegate: delegate, rootQueue: rootQueue)
        
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
                
                if response.response?.statusCode != 200
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
