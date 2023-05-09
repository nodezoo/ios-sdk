//
//  NodeZooServiceError.swift
//  
//
//  Created by Pankaj Kulkarni on 09/05/23.
//

import Foundation

/// The error returned by the ``NodeZooService/search(query:completion:)`` function
///
/// The ``NodeZooService`` will return one of these errors or Error when unable to decode the response.
public enum NodeZooServiceError: Error {
    /// Invalid request - Should never happen – report to the package creator.
    case invalidRequest
    /// The HTTP Response is invalid
    case invalidResponse
    /// No data received
    case noData
    /// Non-success (200) response
    case serverError
}
