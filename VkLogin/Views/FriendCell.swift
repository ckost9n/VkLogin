//
//  FriendCell.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit

class FriendCell: UITableViewCell {
    
    let avatarImageView = UIImageView()
    let avatarWidth: CGFloat = 50
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configure(friend: Friend) {
        
//        let avatarString = "Avatars/" + friend.avatarString
//        let avatar = UIImage(named: avatarString) ?? UIImage(systemName: "person.crop.circle.badge.xmark")
        avatarImageView.downloaded(from: friend.photo50)
       
        let avatar = avatarImageView.image

        var content = defaultContentConfiguration()
        
        content.text = friend.firstName + " " + friend.lastName
//        content.text = friend.fullName
        content.image = avatar
        
        content.imageProperties.maximumSize.width = avatarWidth
        content.imageProperties.maximumSize.height = avatarWidth
        content.imageProperties.cornerRadius = avatarWidth / 2
        
        contentConfiguration = content
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
