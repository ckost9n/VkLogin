//
//  GroupCell.swift
//  VkLogin
//
//  Created by Konstantin on 03.07.2022.
//

import UIKit
import Kingfisher

class GroupCell: UITableViewCell {
    
    let avatarImageView = UIImageView()
    let avatarWidth: CGFloat = 50
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    func configure(group: Group) {
        
        let avatarImageView = UIImageView()
        
        if let urlAvatar = URL(string: group.photo50) {
            let resource = ImageResource(downloadURL: urlAvatar)
            avatarImageView.kf.setImage(with: resource)
        }
        
        var content = defaultContentConfiguration()
        
        content.text = group.name
        content.image = avatarImageView.image
        
        content.imageProperties.maximumSize.width = avatarWidth
        content.imageProperties.maximumSize.height = avatarWidth
        content.imageProperties.cornerRadius = avatarWidth / 2
        
        contentConfiguration = content
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
