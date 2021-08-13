//
//  HttpMethod.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import Foundation

// MARK: - HttpMethod

public enum HttpMethod {
    case delete
    case get
    case post
    case put
    
    public var name: String {
        let name: String
        
        switch self {
        case .delete:
            name = "DELETE"
        case .get:
            name = "GET"
        case .post:
            name = "POST"
        case .put:
            name = "PUT"
        }
        
        return name
    }
}
