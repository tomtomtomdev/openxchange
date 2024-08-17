//
//  ContentView.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CurrencyViewModel(
        currencyApi: CurrenciesApiImplementation()
    )
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .trailing) {
                TextField("Amount", text: $viewModel.amount)
                    .keyboardType(.numberPad)
                    .padding(8)
                    .textFieldStyle(.roundedBorder)
                          
                          CurrencyModelSubview(currencies: viewModel.currencies,
                                               selectedCurrency: $viewModel.selectedCurrency,
                                               conversion: viewModel.conversion)
                          
                          if let error = viewModel.error {
                    CurrencyErrorView(error: error)
                }
                          }
                    .padding()
                    .onAppear(perform: {
                viewModel.updateAllCurrencies()
            })
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
