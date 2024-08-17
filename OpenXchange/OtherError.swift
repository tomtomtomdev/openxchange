//
//  OtherError.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

enum OtherError: String, Error {
    
    case decodingFailure = "Something wrong with decoding process",
         emptyData = "Empty data found on response",
         responseFailure = "Something wrong with response"
}
