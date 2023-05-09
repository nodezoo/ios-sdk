//
//  APIService.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation

protocol APIServicingClosure {
    func search(request: URLRequest, completion: @escaping (Result<[NZPackage], Error>)->Void) -> URLSessionDataTask?
}

struct ClosureBasedAPIService: APIServicingClosure {
    
    var urlSession = URLSession.shared

    
    func search(request: URLRequest, completion: @escaping (Result<[NZPackage], Error>) -> Void) -> URLSessionDataTask? {
        
        let dataTask = urlSession.dataTask(with: request) {data, response, error in
            print("Received response")
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NodeZooServiceError.invalidResponse))
                return
            }
            
            // --- Debugging purpose only ---
            print("Status code: \(httpResponse.statusCode)")
            if let data = data {
                print("Data: \(String(describing: String(data: data, encoding: .utf8)))")
            }
                        
            guard httpResponse.statusCode == 200 else {
                completion(.failure(NodeZooServiceError.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(NodeZooServiceError.noData))
                return
            }
            
            do {
                let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(searchResponse.data.packages))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
        return dataTask
    }
    
    
}
