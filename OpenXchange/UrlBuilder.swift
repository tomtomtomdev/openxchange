//
//  UrlBuilder.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

struct UrlBuilder {
    
    let endpoint: Endpoints
    
    var url: URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = Constant.openExchangeHost
        component.path = endpoint.path
        component.queryItems = endpoint.parameter?.toQueryItems
        
        return component.url
    }
}

extension [String: Any] {
    var toQueryItems: [URLQueryItem] {
        return zip(keys, values)
            .map { key, value in
                    .init(name: key, value: "\(value)")
            }
    }
}
