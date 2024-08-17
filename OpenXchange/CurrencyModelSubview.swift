//
//  CurrencyModelSubview.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation
import SwiftUI

struct CurrencyModelSubview: View {
    
    let currencies: [CurrencyModel]
    @Binding var selectedCurrency: CurrencyModel?
    let conversion: [ConversionModel]
    
    var body: some View {
        
        Menu {
            ForEach(currencies) { each in
                Button(each.country) {
                    selectedCurrency = each
                }
            }
        } label: {
            Text("Select Currency: \(selectedCurrency?.country ?? "")")
            Image(systemName: "chevron.down")
        }
        .padding(.bottom)
        
        LazyVGrid(columns: columns, spacing: 0,
                  content: {
            ForEach(conversion) { each in
                
                ConversionView(conversion: each)
            }
        })
    }
}

let columns = (1...3).map { _ in
    GridItem(.flexible(minimum: 100, maximum: 200))
}
