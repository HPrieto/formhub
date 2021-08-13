//
//  APIResponse.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

public struct APIResponse<T: Decodable>: Decodable {
    public let error: APIError?
    public let data: T?
    
    private enum CodingKeys: String, CodingKey {
        case error = "error"
        case data = "data"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try container.decodeIfPresent(APIError.self, forKey: .error)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }
}
