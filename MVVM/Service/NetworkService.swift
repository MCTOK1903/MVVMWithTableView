//
//  NetworkService.swift
//  MVVM
//
//  Created by MCT on 6.10.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    // MARK:Properties
    public static let shared: NetworkService = NetworkService()
    
}

// MARK: - public Functions

extension NetworkService {
    
    public func service<T:Codable>(_ method: HTTPMethod,url:String,model: T.Type,completion: @escaping(AFResult<Codable>) -> Void ) {
        
        AF.request(url,method:method,encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value as [String:AnyObject]):
                do {
                    let responseJsonData = JSON(value)
                    let responseModel = try JSONDecoder().decode(model.self, from: responseJsonData.rawData())
                    completion(.success(responseModel))
                }
                catch let parsingError {
                    print("Success (error): \(parsingError)")
                }
            case .failure(let error):
                print("Failure: \(error)")
                completion(.failure(error))
                
            default: fatalError("Fatal Error")
            }
        }
    }
}
