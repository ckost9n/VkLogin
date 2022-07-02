//
//  Friend.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

struct Friend {
    let name: String
    let surName: String
    let avatarString: String
    let imagesString: [String]
    
    var fullName: String {
        return name + " " + surName
    }
    
    static func getFriends(count: Int) -> [Friend] {
        var friends: [Friend] = []
        for _ in 0...count {
            let imagesCount = Int.random(in: 1...7)
            var images: [String] = []
            for _ in 0...imagesCount {
                images.append(String(Int.random(in: 1...20)))
            }
            friends.append(
                Friend(
                    name: Lorem.firstName,
                    surName: Lorem.lastName,
                    avatarString: String(Int.random(in: 1...20)),
                    imagesString: images
                )
            )
        }
        return friends
    }
}
