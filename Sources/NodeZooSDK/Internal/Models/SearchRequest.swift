//
//  SearchRequest.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation

// MARK: - SearchRequest
internal struct SearchRequest: Encodable {
    let role = "web", scope = "public", search = "pkgs"
    let prefix: String
    
    var body: Data? {
        var encodedData: Data? = nil
        do {
            encodedData = try JSONEncoder().encode(self)
        } catch {
            print("Error encoding: \(error)")
        }
        return encodedData
    }
    
}


