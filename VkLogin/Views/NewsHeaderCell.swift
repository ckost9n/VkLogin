//
//  NewsHeaderCell.swift
//  VkLogin
//
//  Created by Konstantin on 31.07.2022.
//

import UIKit
import Kingfisher

class NewsHeaderCell: UITableViewCell {
    
    private var heightElement = CGFloat(40)
    
    private var nameAndDateStackView = UIStackView()
    
    private var avatarImageView: UIImageView = {
        let element = UIImageView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var autorNameLabel = UILabel(text: "No name")
    private var dateLabel = UILabel(text: "22.02.2022")
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setConstraints()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    func configure(model: FeedViewModel.Cell) {
        
        let urlAvatar = URL(string: model.avatarUrlString)
//        let avatar = UIImage(named: "Thumbnails/0")
        let proccecor = RoundCornerImageProcessor(cornerRadius: 2)
        avatarImageView.kf.setImage(with: urlAvatar, options: [.processor(proccecor)])
        
        autorNameLabel.text = String(model.name)
        dateLabel.text = model.date
    }
    
    private func setupViews() {
        
        addSubview(avatarImageView)
        
   
        nameAndDateStackView = UIStackView(views: [
            autorNameLabel,
            dateLabel
        ], axis: .vertical, spacing: 3)
        
        nameAndDateStackView.alignment = .leading
        
        addSubview(nameAndDateStackView)
        
        autorNameLabel.textAlignment = .left
        dateLabel.textAlignment = .left
         
        avatarImageView.layer.cornerRadius = heightElement / 2
        avatarImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewsHeaderCell {
    private func setConstraints() {
        
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(heightElement)
            make.top.bottom.leading.equalToSuperview().inset(10)
        }
        
        nameAndDateStackView.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.top.bottom.trailing.equalToSuperview().inset(10)
        }
        
    }
}
