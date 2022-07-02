//
//  Group.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

struct Group {
    let name: String
    let avatarString: String
    let imagesString: [String]
    
    static func getGroup(count: Int) -> [Group] {
        var friends: [Group] = []
        for _ in 0...count {
            let imagesCount = Int.random(in: 1...7)
            var images: [String] = []
            for _ in 0...imagesCount {
                images.append(String(Int.random(in: 1...20)))
            }
            friends.append(
                Group(
                    name: Lorem.firstName,
                    avatarString: String(Int.random(in: 1...20)),
                    imagesString: images
                )
            )
        }
        return friends
    }
}
