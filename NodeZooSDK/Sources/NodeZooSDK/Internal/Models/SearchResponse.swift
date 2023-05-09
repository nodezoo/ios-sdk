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
    let data: DataClass
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case ok, data
        case meta = "meta$"
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
