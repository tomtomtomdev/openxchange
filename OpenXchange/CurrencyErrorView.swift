//
//  CurrencyErrorView.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation
import SwiftUI

final class SampleError: Error {}

struct CurrencyErrorView: View {
    let error: Error
    
    var body: some View {
        
        Text("Fail to get currencies")
            .padding(.bottom)
            .dynamicTypeSize(.large)
        Text(error.localizedDescription)
            .dynamicTypeSize(.small)
    }
}

#Preview {
    CurrencyErrorView(error: SampleError())
}
