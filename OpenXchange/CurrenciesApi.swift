//
//  CurrenciesApi.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

protocol CurrenciesApi {
    func call(completion: @escaping (Result<[CurrencyModel], OtherError>) -> Void)
}

final class CurrenciesApiImplementation: CurrenciesApi {
    
    func call(completion: @escaping (Result<[CurrencyModel], OtherError>) -> Void) {
        
        let builder = UrlBuilder(endpoint: .currencies)
        guard let url = builder.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            switch (data, error) {
            case (.some(let data), nil):
                completion(.success(CurrenciesDecoder.decode(data: data)))
                return
            case (nil, .some):
                completion(.failure(.responseFailure))
                return
            default: return
            }
        }
        .resume()
    }
}
