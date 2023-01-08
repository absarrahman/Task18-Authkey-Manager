//
//  CustomTableViewCell.swift
//  Task 18 (6th Jan)
//
//  Created by Moh. Absar Rahman on 7/1/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemMint
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(codeLabel)
        contentView.addSubview(view)
        
        
        // TITLE LABEL CONSTRAINTS
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10)
            //label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        // CODE LABEL
        NSLayoutConstraint.activate([
            codeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            codeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            codeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            //codeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
