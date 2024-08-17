//
//  ExchangeApi.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation

struct ExchangeApi {
    
    func call(completion: @escaping ((Result<[ExchangeRates], OtherError>) -> Void)) {
        
        let builder = UrlBuilder(endpoint: .latest)
        guard let url = builder.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            switch (data, error) {
            case (.some(let data), nil):
                completion(decodeToResult(data))
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

private func decodeToResult(_ data: Data) -> Result<[ExchangeRates], OtherError> {
    
    let rates = ExchangeDecoder.decode(data: data)
    guard !rates.isEmpty else { return .failure(.emptyData) }
    return .success(rates)
}
