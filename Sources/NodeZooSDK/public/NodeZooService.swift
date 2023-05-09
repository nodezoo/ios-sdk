//
//  NodeZooService.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation

/// Use NodeZooService to fetch the public search function of [nodezoo.com](nodezoo.com)
///
/// While instantiating the ``NodeZooService`` instance pass the API Key as follows:
/// ```
///import NodeZooService
///
///let nodeZooService = NodeZooService(apiKey: "<API Key of >"
/// ```
///
/// And then search the public package as follows:
///
/// ```
/// let dataTask = nodeZooService.search("express") { result in
/// switch result {
/// case .success(let packages):
///     // packages is the array of the found packages
/// case .failure(let error):
///     // handle the error here.
/// }
/// ```
/// The *dataTask* can be used to cancel the search.
///
public class NodeZooService {
    
    private var networkManager: NetworkManager
    
    /// Initializer of NodeZooService
    /// - Parameter apiKey: API Key to search packages from [nodezoo.com](nodezoo.com)
    public init(apiKey: String) {
        networkManager = NetworkManager(apiKey: apiKey)
    }
    
    /// Search the packages
    /// - Parameters:
    ///   - query: The query string to search for.
    ///   - completion: The completion will be invoked with either success or failure.
    /// - Returns: Discardable data task. This can be used to cancel the search.
    ///
    @discardableResult
    public func search(query: String, completion: @escaping (Result<[NZPackage], Error>)->Void) -> URLSessionDataTask? {
        return networkManager.search(package: query, completion: completion)
    }
    
}
