//
//  Networking.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 02/03/24.
//

import Foundation

extension CurrencyViewController {
    
    func fetchCurrency() {
        
        let url = URL(string: Constants.cryptoUrl)!
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                print(Constants.fetchError + "\(error)")
                return
            }
            
            guard let jsonData = data else {
                print(Constants.dataError)
                return
            }
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Raw JSON Data: \(jsonString)")
            } else {
                print(Constants.fetchError)
            }
            
            do {
                let cryptocurrencyResponse = try JSONDecoder().decode(CurrencyObject.self, from: jsonData)
                debugPrint("My Response here: \(cryptocurrencyResponse)")
                cryptocurrencies = cryptocurrencyResponse.cryptocurrencies
                cryptocurrenciesTemp = cryptocurrencies
                debugPrint("My Crypto here: \(cryptocurrencies)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(Constants.decodeError + "\(error.localizedDescription)")
            }
        }.resume()
    }
    
}
