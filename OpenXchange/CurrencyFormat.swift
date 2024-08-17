//
//  CurrencyFormat.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let format = NumberFormatter()
        format.numberStyle = .currencyAccounting
        format.locale = Locale(identifier: "en_US")
        return format
    }
}
