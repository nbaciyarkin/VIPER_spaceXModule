//
//  LaunchesTableViewCell.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import UIKit

import Foundation
import Kingfisher
import SwiftUI


class LaunchesTableViewCell: UITableViewCell {
    var isFilled = false
    
    var cellItem: LaunchModel?
   

    static let identifier = "LaunchesTableViewCell"
    
   
    
    lazy var imageFilled = UIImage(systemName: "suit.heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    lazy var imageEmpty = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    
    let likedButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        image?.withTintColor(.red)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(btn_TUI), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let dateLocalLabel: UILabel = {
        let label = UILabel()
        label.text = "date local"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let flighNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleImageView)
        contentView.addSubview(likedButton)
        contentView.addSubview(dateLocalLabel)
        applyConstraints()
    }
    
    func applyConstraints(){
        let titlesImageViewConstraints = [
            titleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleImageView.widthAnchor.constraint(equalToConstant:100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant:20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: likedButton.leadingAnchor, constant: -10)
        ]
        
        let dateLocalLabelConstraint = [
            dateLocalLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLocalLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLocalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10)
        ]
        
        let playButtonConstraints = [
            likedButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            likedButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(titlesImageViewConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(dateLocalLabelConstraint)
    }
    
    @objc  private func btn_TUI(){
        self.isFilled = !isFilled
        if(isFilled == true) {
            setButtonFilled()
        }
        else {
            setButtonUnFilled()
        }
    }
    
    public func setButtonFilled(){
        likedButton.setImage(imageFilled, for: .normal)
    }
    
    public func setButtonUnFilled() {
        likedButton.setImage(imageEmpty, for: .normal)
    }
    
    public func configure(with model: LaunchesViewModel){
        titleImageView.kf.setImage(with: URL(string: model.image_link))
        titleLabel.text = "Rocket Name: \(model.launchName)"
        dateLocalLabel.text = "Local date:\(model.date_local)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

