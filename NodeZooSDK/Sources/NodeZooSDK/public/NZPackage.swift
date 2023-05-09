//
//  NZPackage.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation


/// This struct contains the details of the NodeJS packages
public struct NZPackage: Codable {
    /// Name of the package
    public let name: String
    /// version of the package
    public let version: String
    /// Description of the package
    public let desc: String
}
