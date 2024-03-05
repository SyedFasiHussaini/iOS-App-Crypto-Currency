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
    
    func getFilteredData(for cryptocurrenciesTemp: [Currency], and selectedOptions: [String]) -> [Currency] {
        var filteredData = cryptocurrenciesTemp
        
        for filter in selectedOptions {
            filteredData = filteredData.filter{ item in
                if filter == "New Coins" {
                    return item.is_new == true
                } else if filter == "Active" {
                    return item.is_active == true
                } else if filter == "Only Token" {
                    return item.type == "token"
                } else if filter == "Only Coins" {
                    return item.type == "coin"
                } else {
                    return item.is_active == false
                }
                
            }
        }
        return filteredData
    }
    
}
