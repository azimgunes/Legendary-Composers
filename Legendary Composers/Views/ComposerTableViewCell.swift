//
//  ComposerTableViewCell.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 29.02.2024.
//

import UIKit

class ComposerTableViewCell: UITableViewCell {

    static let cellId = "ComposerTableViewCell"
    
    
    //MARK: - UI
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.tintColor = .white
        return label
    }()
    
    private lazy var birthdayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.tintColor = .white
        return label
    }()

    private lazy var deathLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.tintColor = .white
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.tintColor = .white
        return label
    }()
    
    func configure(){
        
        containerView.backgroundColor = ComposerType.beethoven.background
        
        nameLabel.text = "Beethoven"
        birthdayLabel.text = "1770"
        deathLabel.text = "1827"
        infoLabel.text = "Ludwig van Beethoven was a German pianist and composer widely considered to be one of the greatest musical geniuses of all time. His innovative compositions combined vocals and instruments, widening the scope of sonata, symphony, concerto and quartet. He is the crucial transitional figure connecting the Classical and Romantic ages of Western music."
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(birthdayLabel)
        contentStackView.addArrangedSubview(deathLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8),
            contentStackView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8),
            contentStackView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -8),
 
        ])
       
        

        
    }
}
