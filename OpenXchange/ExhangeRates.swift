//
//  ExhangeRates.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

struct ExchangeStructure: Decodable {
    
    let rates: [ExchangeRates]
    
    enum CodingKeys: CodingKey {
        case rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dictionary = try container.decode([String: Double].self, forKey: .rates)
        self.rates = dictionary.enumerated().map { each in
            ExchangeRates(code: each.element.key, rate: each.element.value)
        }
    }
}

struct ExchangeRates: Decodable {
    
    let code: String
    let rate: Double
}
