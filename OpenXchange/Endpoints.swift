//
//  Endpoints.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

enum Endpoints {
    case latest,
    currencies,
    historical(Date)
}

extension Endpoints {
    
    var path: String {
        switch self {
        case .currencies: return "/api/currencies.json"
        case .historical(let date): return "/api/historical/\(date.ddmmyyyy).json"
        case .latest: return "/api/latest.json"
        }
    }
    
    var parameter: [String: Any]? {
        switch self {
        case .currencies: return ["app_id": Constant.openExchangeAppId]
        case .historical: return ["app_id": Constant.openExchangeAppId]
        case .latest: return ["app_id": Constant.openExchangeAppId]
        }
    }
}

extension DateFormatter {
    static let `default` = DateFormatter()
}

extension Date {
    
    var ddmmyyyy: String {
        DateFormatter.default.dateFormat = "dd-mm-yyyy"
        return DateFormatter.default.string(from: self)
    }
}
