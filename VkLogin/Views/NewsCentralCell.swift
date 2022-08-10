//
//  NewsCentralCell.swift
//  VkLogin
//
//  Created by Konstantin on 06.08.2022.
//

import UIKit
import Kingfisher

class NewsCentralCell: UITableViewCell {
    
    private var mainStackView = UIStackView()
    
    private var postLabel = UILabel(text: "")
    
    private var imageLabel: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
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
        if let urlString = model.photoAttachments?.photoUrlString {
            imageLabel.isHidden = false
            let urlAvatar = URL(string: urlString)
            
            let proccecor = RoundCornerImageProcessor(cornerRadius: 20)
            imageLabel.kf.setImage(with: urlAvatar, options: [.processor(proccecor)])
        } else {
            imageLabel.isHidden = true
        }
        if let text = model.text {
            postLabel.isHidden = false
            postLabel.text = text
        } else {
            postLabel.isHidden = true
        }
        
    }
    
    private func setupViews() {
        
        mainStackView = UIStackView(views: [
            postLabel,
            imageLabel
        ], axis: .vertical, spacing: 3)
        
        addSubview(mainStackView)
        
        postLabel.textAlignment = .center
        postLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewsCentralCell {
    private func setConstraints() {
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
