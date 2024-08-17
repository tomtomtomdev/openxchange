//
//  CurrencyDatabase.swift
//  OpenXchange
//
//  Created by tomtomtom on 1/27/24.
//

import Foundation
import SwiftData

//protocol CurrencyDatabase {
//    func store(_ data: [CurrencyStoredModel])
//    func read() -> [CurrencyStoredModel]
//}

//final class CurrencyDatabaseImplementation: CurrencyDatabase {
//    private let container: ModelContainer?
//    private let context: ModelContext?
//    
//    init() {
//        self.container = try? ModelContainer(for: CurrencyStoredModel.self)
//        guard let container = container else {
//            self.context = nil
//            return
//        }
//        self.context = ModelContext(container)
//    }
//    
//    func store(_ data: [CurrencyStoredModel]) {
//        guard let context = context else { return }
//        data.forEach { each in
//            context.insert(each)
//        }
//        
//        guard let _ = try? context.save() else { return }
//    }
//    
//    func read() -> [CurrencyStoredModel] {
//        guard let context = context else { return [] }
//        let descriptor = FetchDescriptor<CurrencyStoredModel>()
//        
//        guard let result = try? context.fetch(descriptor) else { return [] }
//        return result
//    }
//}
