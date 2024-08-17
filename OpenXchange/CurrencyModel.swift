//
//  CurrencyModel.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation
import SwiftData

struct CurrencyModel: Identifiable, Decodable, Equatable {
    let id: Int
    let code: String
    let country: String
}
