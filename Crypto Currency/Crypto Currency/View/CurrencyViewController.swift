//
//  ViewController.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 28/02/24.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let searchBarView = UIView()
    let filterView = UIView()
    
    let headerLabel = UILabel()
    let searchBar = UISearchBar()
        
    var cryptocurrencies: [Currency] = []
    var cryptocurrenciesTemp: [Currency] = []
    var cryptocurrenciesFiltered: [Currency] = []
    let currencyViewModel = CurrencyViewModel()
    
    var filterSelected: [String] = []
    var buttonWidth = 0.0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent // Change status bar style to white
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonWidth = (view.frame.width/CGFloat(3)) - 20
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .gray
        view.addSubview(tableView)
        
        applyTableViewConstraints()
        configureSearchBarAndFilterView()
        layoutFilterButtons()
        fetchCurrency()
    }
    
    func applyTableViewConstraints() {
        
        tableView.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: view.frame.height - 290)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func configureSearchBarAndFilterView() {
        
        searchBarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        searchBarView.backgroundColor = .systemIndigo
        view.addSubview(searchBarView)
        
        // Add a search bar
        searchBar.frame = CGRect(x: 150, y: 55, width: view.frame.width, height: searchBarView.frame.height - 60)
        searchBar.placeholder = "Search"
        searchBar.tintColor = .black
        searchBar.delegate = self
        searchBar.searchTextField.textColor = .black
        searchBarView.addSubview(searchBar)
        
        // Add a label
        headerLabel.frame = CGRect(x: 20, y: 35, width: view.frame.width, height: searchBarView.frame.height - 20)
        headerLabel.text = "COIN"
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 25)
        headerLabel.textAlignment = .left
        searchBarView.addSubview(headerLabel)
        
        // Configure filter view
        filterView.frame = CGRect(x: 0, y: view.frame.height - 150, width: view.frame.width, height: 150)
        filterView.backgroundColor = .lightGray
        view.addSubview(filterView)
    }
    
    func layoutFilterButtons() {
        
        let newButton = createFilterButton(title: "New Coins", tag: 1)
        let activeButton = createFilterButton(title: "Active", tag: 2)
        let inactiveButton = createFilterButton(title: "Inactive", tag: 3)
        let tokenButton = createFilterButton(title: "Only Token", tag: 4)
        let coinButton = createFilterButton(title: "Only Coins", tag: 5)
        
        filterView.addSubview(newButton)
        filterView.addSubview(activeButton)
        filterView.addSubview(inactiveButton)
        filterView.addSubview(tokenButton)
        filterView.addSubview(coinButton)
        
        newButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
        activeButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
        inactiveButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
        tokenButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
        coinButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    func createFilterButton(title: String, tag: Int) -> UIButton {
        let button = UIButton()
        if tag <= 3 {
            button.frame = CGRect(x: 20 + (tag - 1) * 120, y: 20, width: Int(buttonWidth), height: 40)
        } else {
            button.frame = CGRect(x: 40 + (tag - 4) * 130, y: 75, width: Int(buttonWidth), height: 40)
        }
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = tag
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
        }
    
    @objc func filterButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let filter = sender.title(for: .normal) ?? ""
        
        if sender.isSelected {
            filterSelected.append(filter)
            sender.backgroundColor = .darkGray
            sender.setTitleColor(.white, for: .normal)
        } else {
            if let index = filterSelected.firstIndex(of: filter) {
                filterSelected.remove(at: index)
                sender.backgroundColor = .white
                sender.setTitleColor(.black, for: .normal)
            }
        }
        applyFilter()
    }

    func applyFilter() {
        var filteredData = cryptocurrenciesTemp
        
        for filter in filterSelected {
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
        cryptocurrencies = filteredData
        tableView.reloadData()
        
    }
    
    func getNewImageValue(for flag: Bool) -> String {
        return currencyViewModel.getValueForFlag(flag)
    }
    
    func getImageName(for type: String, is active: Bool) -> String {
        return currencyViewModel.getImageValueForType(for: type, is: active)
    }
    
}

