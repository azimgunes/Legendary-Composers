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
    
    private lazy var badgeImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
       return imageView
    }()
    
    private lazy var playButton : UIButton = {
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.tintColor = .white
        return playButton
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var birthdayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()

    private lazy var deathLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 15
    }
    
    func configure(){
        
        containerView.backgroundColor = ComposerType.beethoven.background
        
        badgeImageView.image = ComposerType.beethoven.badge
        playButton.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)), for: .normal)
        
        
        nameLabel.text = "Beethoven"
        birthdayLabel.text = "1770"
        deathLabel.text = "1827"
        infoLabel.text = "Ludwig van Beethoven was a German pianist and composer widely considered to be one of the greatest musical geniuses of all time. His innovative compositions combined vocals and instruments, widening the scope of sonata, symphony, concerto and quartet. He is the crucial transitional figure connecting the Classical and Romantic ages of Western music."
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImageView)
        containerView.addSubview(playButton)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(birthdayLabel)
        contentStackView.addArrangedSubview(deathLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badgeImageView.heightAnchor.constraint(equalToConstant: 50),
            badgeImageView.widthAnchor.constraint(equalToConstant: 50),
            badgeImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: 8),
            
            playButton.heightAnchor.constraint(equalToConstant: 44),
            playButton.widthAnchor.constraint(equalToConstant: 44),
            playButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
 
        ])
       
        

        
    }
}
