//
//  NewsCell.swift
//  VkLogin
//
//  Created by Konstantin on 03.07.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    private var mainStackView = UIStackView()
    private var headerStackView = UIStackView()
    private var nameAndDateStackView = UIStackView()
    
    private var avatarImageView: UIImageView = {
        let element = UIImageView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var autorNameLabel = UILabel(text: "No name")
    private var dateLabel = UILabel(text: "22.02.2022")
    private var postTextLabel = UILabel(text: "No text")
    private let imagesView: UIView = {
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
        
    }
    
    
    
    func configure(newsItem: NewsItem) {
        
        
        
        let avatarString = "Avatars/" + newsItem.avatarString
        let avatar = UIImage(named: avatarString)
        
        avatarImageView.image = avatar
        
        autorNameLabel.text = newsItem.autorName
        postTextLabel.text = newsItem.text
        

//        var content = defaultContentConfiguration()
//
//        content.text = newsItem.autorName
//        content.image = avatar
//
//        content.imageProperties.maximumSize.width = 50
//        content.imageProperties.maximumSize.height = 50
//        content.imageProperties.cornerRadius = (content.image?.size.width)! / 2
//
//        contentConfiguration = content
        
    }
    
    private func setupViews() {
        
        postTextLabel.numberOfLines = 0
        
        nameAndDateStackView = UIStackView(views: [
            autorNameLabel,
            dateLabel
        ], axis: .vertical, spacing: 3)
        
        headerStackView = UIStackView(views: [
            avatarImageView,
            nameAndDateStackView
        ], axis: .horizontal, spacing: 10)
        
        mainStackView = UIStackView(views: [
            headerStackView,
            postTextLabel,
            imagesView
        ], axis: .vertical, spacing: 10)
        
        addSubview(mainStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewsCell {
    private func setConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
