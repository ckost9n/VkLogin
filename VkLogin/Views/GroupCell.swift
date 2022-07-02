//
//  GroupCell.swift
//  VkLogin
//
//  Created by Konstantin on 03.07.2022.
//

import UIKit

class GroupCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    func configure(group: Group) {
        
        let avatarString = "Avatars/" + group.avatarString
        let avatar = UIImage(named: avatarString) ?? UIImage(systemName: "person.crop.circle.badge.xmark")
        
        var content = defaultContentConfiguration()
        
        content.text = group.name
        content.image = avatar
        
        content.imageProperties.maximumSize.width = 50
        content.imageProperties.maximumSize.height = 50
        content.imageProperties.cornerRadius = (content.image?.size.width)! / 2
        
        contentConfiguration = content
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
