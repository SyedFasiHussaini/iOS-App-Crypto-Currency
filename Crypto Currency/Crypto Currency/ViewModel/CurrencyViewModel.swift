//
//  CurrencyViewModel.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 02/03/24.
//

import Foundation

struct CurrencyViewModel {
    
    func getValueForFlag(_ flag: Bool) -> String {
       return flag ? "new.png" : ""
    }
    
    func getImageValueForType(for type: String, is active: Bool) -> String {
       return active ? (type == "token" ? "token.png" : "coin.png") : "inactive.png"
    }
    
    
}
