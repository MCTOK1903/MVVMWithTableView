//
//  CustomTableViewCell.swift
//  MVVM
//
//  Created by MCT on 6.10.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: Views
    
    let movieNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Go Lang created by Google"
        label.allowsDefaultTighteningForTruncation = true
        return label
    }()
    
    let movieVoteLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Go Lang created by Google"
        label.allowsDefaultTighteningForTruncation = true
        return label
    }()
    
    
    // MARK: Properties
    
    
    // MARK: LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(movieVoteLabel)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Fucs
    
    func setUpUI(){
        movieNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        movieVoteLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10).isActive = true
        movieVoteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        movieVoteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        movieVoteLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
