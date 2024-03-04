//
//  CryptoCurrencies.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 29/02/24.
//

import Foundation

struct CurrencyObject: Codable {
    
    let cryptocurrencies: [Currency]
    
}

struct Currency: Codable {
    
    let name: String
    let symbol: String
    let is_new: Bool
    let is_active: Bool
    let type: String
    
}
