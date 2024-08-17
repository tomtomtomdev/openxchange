//
//  CurrencyViewModel.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

final class CurrencyViewModel: ObservableObject {
    
    init(currencyApi: CurrenciesApi) {
        self.currencyApi = currencyApi
    }
    
    private let currencyApi: CurrenciesApi
    private let exchangeApi = ExchangeApi()
    
    @Published var currencies = [CurrencyModel]()
    @Published var selectedCurrency: CurrencyModel? {
        didSet {
            convert()
        }
    }
    @Published var error: Error?
    
    @Published var rates = [ExchangeRates]()
    @Published var conversion = [ConversionModel]()
    
    var amount = "" {
        didSet {
            convert()
        }
    }
    
    func updateAllCurrencies() {
        currencyApi.call { [weak self] result in
            self?.handleCurrencies(result)
        }
        
        exchangeApi.call { [weak self] result in
            self?.handleExchangeRates(result)
        }
    }
    
    private var amountInDouble: Double {
        NumberFormatter.shared
            .number(from: amount)?
            .doubleValue ?? 0
    }
    
    private func convert() {
        guard let selected = rates.first(where: { $0.code == selectedCurrency?.code }) else { return }
        
        conversion = rates.enumerated().map { each in
            ConversionModel(
                id: each.offset,
                code: each.element.code,
                amount: Double(each.element.rate/selected.rate * amountInDouble)
                    .conversionNumber
                    .formattedString)
        }
    }
    
    private func handleCurrencies(_ result: Result<[CurrencyModel], OtherError>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let success):
                self.currencies = success
                break
            case .failure(let failure):
                self.error = failure
                break
            }
        }
    }
    
    private func handleExchangeRates(_ result: Result<[ExchangeRates], OtherError>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let success):
                self.rates = success
                break
            case .failure(let failure):
                self.error = failure
                break
            }
        }
    }
}

extension NumberFormatter {
    static let shared = NumberFormatter()
}

extension Double {
    var conversionNumber: NSNumber {
        NSNumber(value: self)
    }
}

extension NSNumber {
    var formattedString: String {
        NumberFormatter.shared.maximumFractionDigits = 2
        return NumberFormatter.shared.string(from: self) ?? "0"
    }
}
