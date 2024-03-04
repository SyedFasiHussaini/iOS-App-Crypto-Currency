//
//  CurrencyTableView.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 04/03/24.
//

import Foundation
import UIKit

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptocurrencies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.titleLabel.text = cryptocurrencies[indexPath.row].name
        cell.subTitleLabel.text = cryptocurrencies[indexPath.row].symbol
        let imageName = getImageName(for: cryptocurrencies[indexPath.row].type, is: cryptocurrencies[indexPath.row].is_active)
        cell.imageIcon.image = UIImage(named: imageName)
        
        let newImageValue = getNewImageValue(for: cryptocurrencies[indexPath.row].is_new)
        cell.newIcon.image = UIImage(named: newImageValue)
        return cell
    }
    
}
