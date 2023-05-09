//
//  NetworkManager.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation

struct NetworkManager {
    
    let apiKey: String
    let apiService: APIServicingClosure
    
    init(apiKey: String, apiService: APIServicingClosure = ClosureBasedAPIService()) {
        self.apiKey = apiKey
        self.apiService = apiService
    }
    
    @discardableResult
    func search(package: String, completion: @escaping (Result<[NZPackage], Error>)->Void) -> URLSessionDataTask? {
        print("Searching for: \(package)")
        guard var request = createRequest() else {
            print("Invalid Request")
            completion(.failure(NodeZooServiceError.invalidRequest))
            return nil
        }
        let searchRequest = SearchRequest(prefix: package)
        print("Search request: \(searchRequest)")
        
        request.httpBody = searchRequest.body
        
        return apiService.search(request: request, completion: completion)
        
    }
    
    func createRequest() -> URLRequest? {
        guard let url = URL(string: "https://api.nodezoo.com/api/public") else {
            print("Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        return request
    }
    
}
