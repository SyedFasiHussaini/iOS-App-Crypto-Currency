//
//  SearchField.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 04/03/24.
//

import UIKit

extension CurrencyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard searchText != "" else {
            cryptocurrencies = cryptocurrenciesTemp
            tableView.reloadData()
            return
        }
        cryptocurrencies = cryptocurrenciesTemp
        cryptocurrenciesFiltered = cryptocurrencies.filter{
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.symbol.lowercased().contains(searchText.lowercased())
        }
        cryptocurrencies = cryptocurrenciesFiltered
        tableView.reloadData()
    }
}
