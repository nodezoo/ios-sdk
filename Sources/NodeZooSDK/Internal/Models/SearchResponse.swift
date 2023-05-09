//
//  SearchResponse.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation

// MARK: - SearchResponse
internal struct SearchResponse: Codable {
    let ok: Bool
    let why: String?
    let details: Details?
    let data: DataClass?
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case ok, data, why, details
        case meta = "meta$"
    }
}

internal struct Details: Codable {
    let path: [String]
    let whyExactly: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case whyExactly = "why_exactly"
    }
}

// MARK: - DataClass
internal struct DataClass: Codable {
    let packages: [NZPackage]
    enum CodingKeys: String, CodingKey {
        case packages = "pkgs"
    }
}

// MARK: - Meta
internal struct Meta: Codable {
    let id: String
}
