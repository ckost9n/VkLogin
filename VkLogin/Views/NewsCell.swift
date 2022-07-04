//
//  NewsCell.swift
//  VkLogin
//
//  Created by Konstantin on 03.07.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
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
    private let photoImageView: UIImageView = {
        let element = UIImageView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
        
    }
    
    
    
    func configure(newsItem: NewsItem) {
     
        let avatarString = "Avatars/" + newsItem.avatarString
        let photoString = "Thumbnails/" + newsItem.imageString
        let avatar = UIImage(named: avatarString)
        let photo = UIImage(named: photoString)
        
        avatarImageView.image = avatar
        
        autorNameLabel.text = newsItem.autorName
        postTextLabel.text = newsItem.text
//        postTextLabel.text = "jdhfkghsd"
        photoImageView.image = photo

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
        
        
        
        nameAndDateStackView = UIStackView(views: [
            autorNameLabel,
            dateLabel
        ], axis: .vertical, spacing: 3)
        
        nameAndDateStackView.alignment = .leading
        
        headerStackView = UIStackView(views: [
            avatarImageView,
            nameAndDateStackView
        ], axis: .horizontal, spacing: 10)
        
        contentView.addSubview(headerStackView)
        contentView.addSubview(postTextLabel)
        contentView.addSubview(photoImageView)
        
        autorNameLabel.textAlignment = .left
        dateLabel.textAlignment = .left
//        dateLabel.font =
        
        postTextLabel.numberOfLines = 0
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewsCell {
    private func setConstraints() {
        
//        headerStackView.snp.makeConstraints { make in
//            make.height.equalTo(50)
//        }
        
        let maxWidthContainer: CGFloat = 3
        let maxHeightContainer: CGFloat = 2

        headerStackView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.top.trailing.equalToSuperview().inset(20)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
//            make.top.bottom.leading.equalToSuperview()
        }
        
        nameAndDateStackView.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        postTextLabel.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(postTextLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.width.equalTo(photoImageView.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
    }
}
