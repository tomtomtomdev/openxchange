//
//  ExchangeDecoder.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

struct ExchangeDecoder {
    
    private static let decoder = JSONDecoder()
    
    static func decode(data: Data) -> [ExchangeRates] {
        
        guard let model = try? decoder.decode(ExchangeStructure.self, from: data) else { return [] }
        return model.rates
    }
}
