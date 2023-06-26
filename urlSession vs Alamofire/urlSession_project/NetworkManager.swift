//
//  NetworkManager.swift
//  urlSession_project
//
//  Created by zed on 12.04.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    static func request(method: HTTPMethod = .get,
                        parameters: Parameters? = nil,
                        encoding: ParameterEncoding = URLEncoding.default,
                        headers: HTTPHeader? = nil,
                        completion: @escaping((Post?, String?)->(Void))
    ) {
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding).responseDecodable(of: Post.self) { object in
            
            switch object.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
            
            
        }
        
    }

}
