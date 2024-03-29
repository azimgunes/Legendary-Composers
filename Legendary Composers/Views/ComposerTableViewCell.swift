//
//  ComposerTableViewCell.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 29.02.2024.
//

import UIKit
import SafariServices
import Foundation



class AlertView: UIView {
    
}


protocol ComposerTableViewCellDelegate: class {
    func didTapPlayButton(for composer: Composer)
}

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
    
    private lazy var toSpotify : UIButton = {
        let toYouTube = UIButton()
        toYouTube.translatesAutoresizingMaskIntoConstraints = false
        toYouTube.tintColor = .white
        toYouTube.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ComposerTableViewCell.toYouTubeButton))
        toYouTube.addGestureRecognizer(tap)
        return toYouTube
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(ComposerTableViewCell.tapFunction))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        
        
        return label
    }()
    
    private lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var deathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .medium)
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
    
    private weak var delegate: ComposerTableViewCellDelegate?
    private var composer: Composer?
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 15
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.composer = nil
        self.delegate = nil
        self.contentView.subviews.forEach { $0.removeFromSuperview()}
    }
    
    func configure(with item: Composer, delegate: ComposerTableViewCellDelegate){
        
        self.delegate = delegate
        self.composer = item
        
        playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        toSpotify.addTarget(self, action: #selector(toYouTubeButton), for: .touchUpOutside)
        
        containerView.backgroundColor = item.id.background
        
        badgeImageView.image = item.id.badge
        playButton.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        if #available(iOS 16.0, *) {
            toSpotify.setImage(Assets.toYT, for: .normal)
        } else {
            // Fallback on earlier versions
        }
     
       
        
        
        nameLabel.text = item.name
        birthdayLabel.text = "Birth: \(item.birthday)"
        deathLabel.text = "Death: \(item.death.country) \(item.death.date)"
        infoLabel.text = item.info
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImageView)
        containerView.addSubview(playButton)
        containerView.addSubview(toSpotify)
        
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
            contentStackView.leadingAnchor.constraint(equalTo: toSpotify.trailingAnchor, constant: 8),
            
            playButton.heightAnchor.constraint(equalToConstant: 44),
            playButton.widthAnchor.constraint(equalToConstant: 44),
            playButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
          
            
            
            toSpotify.heightAnchor.constraint(equalToConstant: 35),
            toSpotify.widthAnchor.constraint(equalToConstant: 35),
            toSpotify.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: 55),
            toSpotify.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8)
            
            
        ])
        
    }
    
    @objc func didTapPlayButton(){
        
        if let composer = composer {
            delegate?.didTapPlayButton(for: composer)
            
        }
    }

        
        @objc func tapFunction(sender:UITapGestureRecognizer) {
            
            if nameLabel.text == "Ludwig van Beethoven" {
                if let url = URL(string: "https://tr.wikipedia.org/wiki/Ludwig_van_Beethoven") {
                    UIApplication.shared.open(url)
                }
            } else {
                if nameLabel.text == "Wolfgang Amadeus Mozart" {
                    if let url = URL(string: "https://tr.wikipedia.org/wiki/Wolfgang_Amadeus_Mozart") {
                        UIApplication.shared.open(url)
                    }
                } else {
                    if nameLabel.text == "Antonio Vivaldi" {
                        if let url = URL(string: "https://tr.wikipedia.org/wiki/Antonio_Vivaldi") {
                            UIApplication.shared.open(url)
                        }
                    } else {
                        if nameLabel.text == "Frédéric Chopin" {
                            if let url = URL(string: "https://tr.wikipedia.org/wiki/Fr%C3%A9d%C3%A9ric_Chopin") {
                                UIApplication.shared.open(url)
                            }
                        } else {
                            if nameLabel.text == "Franz Schubert" {
                                if let url = URL(string: "https://tr.wikipedia.org/wiki/Franz_Schubert") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }


extension ComposerTableViewCell {
    @objc func toYouTubeButton(){
        if nameLabel.text == "Ludwig van Beethoven" {
            if let url = URL(string: "https://open.spotify.com/intl-tr/artist/2wOqMjp9TyABvtHdOSOTUS") {
                UIApplication.shared.open(url)
            }
        } else {
            if nameLabel.text == "Wolfgang Amadeus Mozart" {
                if let url = URL(string: "https://open.spotify.com/intl-tr/artist/4NJhFmfw43RLBLjQvxDuRS") {
                    UIApplication.shared.open(url)
                }
            } else {
                if nameLabel.text == "Antonio Vivaldi" {
                    if let url = URL(string: "https://open.spotify.com/intl-tr/artist/2QOIawHpSlOwXDvSqQ9YJR") {
                        UIApplication.shared.open(url)
                    }
                } else {
                    if nameLabel.text == "Frédéric Chopin" {
                        if let url = URL(string: "https://open.spotify.com/intl-tr/artist/7y97mc3bZRFXzT2szRM4L4") {
                            UIApplication.shared.open(url)
                        }
                    } else {
                        if nameLabel.text == "Franz Schubert" {
                            if let url = URL(string: "https://open.spotify.com/intl-tr/artist/2p0UyoPfYfI76PCStuXfOP") {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                }
            }
        }
    }
}
