//
//  CurrenciesDecoder.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

struct CurrenciesDecoder {
    private static let decoder = JSONDecoder()
    
    static func decode(data: Data) -> [CurrencyModel] {
        
        guard let dictionary = try? decoder.decode([String: String].self, from: data) else { return [] }
        return dictionary.enumerated().map { each in
            CurrencyModel(id: each.offset,
                          code: each.element.key,
                          country: each.element.value)
        }
    }
}
