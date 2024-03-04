//
//  MyTableViewCell.swift
//  Crypto Currency
//
//  Created by Syed Fasiullah Hussaini on 28/02/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    let newIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(imageIcon)
        addSubview(newIcon)
        
        NSLayoutConstraint.activate([
            // titleLabel constraints
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            
            // subTitleLabel constraints
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: imageIcon.leadingAnchor, constant: -8), // Use lessThanOrEqualTo instead of equalTo to avoid conflict
            subTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            // imageIcon constraints
            imageIcon.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageIcon.widthAnchor.constraint(equalToConstant: 60),
            imageIcon.heightAnchor.constraint(equalToConstant: 75),
            imageIcon.trailingAnchor.constraint(equalTo: newIcon.leadingAnchor, constant: 25),
            
            // newIcon constraints
            newIcon.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            newIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            newIcon.widthAnchor.constraint(equalToConstant: 30),
            newIcon.heightAnchor.constraint(equalToConstant: 30),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
