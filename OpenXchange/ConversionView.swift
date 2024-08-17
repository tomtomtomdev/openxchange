//
//  ConversionView.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation
import SwiftUI

struct ConversionView: View {
    let conversion: ConversionModel
    
    var body: some View {
        VStack {
            Text(conversion.code)
                .dynamicTypeSize(.medium)
                .padding(.bottom, 2)
            Text(conversion.amount)
                .dynamicTypeSize(.small)
        }
        .padding()
    }
}

#Preview {
    ConversionView(
        conversion: ConversionModel(
            id: 0,
            code: "USD",
            amount: "12.50"))
}

