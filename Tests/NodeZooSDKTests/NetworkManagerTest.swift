//
//  NetworkManagerTest.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation
import XCTest
@testable import NodeZooSDK

struct MockAPIService: APIServicingClosure {
    var result = Result<[NZPackage], Error>.success([])
    func search(request: URLRequest, completion: @escaping (Result<[NZPackage], Error>) -> Void) -> URLSessionDataTask? {
        completion(result)
        return URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://www.google.com")!))
    }
    
    
}

final class NetworkManagerTest: XCTestCase {
    
    func testSearch_success_returnsOneResult() {
        let mockService = MockAPIService(result: .success([NZPackage(name: "name", version: "version", desc: "description")]))
        let networkManager = NetworkManager(apiKey: "", apiService: mockService)
        
        networkManager.search(package: "searchString") { result in
            if case .success(let success) = result {
                XCTAssertEqual(1, success.count)
            }
        }
    }
    
    func testSearch_success_returnsZeroResult() {
        let mockService = MockAPIService(result: .success([]))
        let networkManager = NetworkManager(apiKey: "", apiService: mockService)
        
        networkManager.search(package: "searchString") { result in
            if case .success(let success) = result {
                XCTAssertEqual(0, success.count)
            }
        }
    }
    
    
    func testSearch_error_returnsZeroResult() {
        let mockService = MockAPIService(result: .failure(NodeZooServiceError.serverError))
        let networkManager = NetworkManager(apiKey: "", apiService: mockService)
        
        networkManager.search(package: "searchString") { result in
            if case .failure(let failure) = result {
                XCTAssertEqual(failure as! NodeZooServiceError, NodeZooServiceError.serverError)
            }
        }
    }
    
    
}
