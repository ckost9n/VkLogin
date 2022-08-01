//
//  NewsFooterCell.swift
//  VkLogin
//
//  Created by Konstantin on 01.08.2022.
//

import UIKit

class NewsFooterCell: UITableViewCell {
    
    private var mainStackView = UIStackView()
    
    private lazy var likesButton: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .gray
        element.setImage(UIImage(systemName: "heart"), for: .normal)
        element.setTitle("189", for: .normal)
        element.addTarget(self, action: #selector(likesButtonTapped), for: .touchUpInside)
        return element
    }()
    
    private lazy var commentButton: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .darkGray
        element.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        element.setTitle("3", for: .normal)
        element.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        return element
    }()
    
    private lazy var repostButton: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .darkGray
        element.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        element.setTitle("2", for: .normal)
        element.addTarget(self, action: #selector(repostButtonTapped), for: .touchUpInside)
        return element
    }()
    
    private lazy var viewsButton: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .darkGray
        element.setImage(UIImage(systemName: "eye"), for: .normal)
        element.setTitle("5K", for: .normal)
        return element
    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupViews()
//        setConstraints()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        mainStackView = UIStackView(views: [
            likesButton,
            commentButton,
            repostButton,
            viewsButton
        ], axis: .horizontal, spacing: 30)
        addSubview(mainStackView)
    }
    
    @objc func likesButtonTapped() {
        print(#function)
    }
    
    @objc func commentButtonTapped() {
        print(#function)
    }
    
    @objc func repostButtonTapped() {
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewsFooterCell {
    
    private func setConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
}
