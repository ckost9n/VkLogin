//
//  Friend.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

// MARK: - FriendItem
struct FriendItem: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
struct Friend: Codable {
    let id: Int
    let domain, trackCode: String
    let photo50: String
    let firstName, lastName: String
    let canAccessClosed, isClosed: Bool?
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id, domain
        case trackCode = "track_code"
        case photo50 = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case deactivated
    }
}

struct FriendFake {
    let name: String
    let surName: String
    let avatarString: String
    let imagesString: [String]
    
    var fullName: String {
        return name + " " + surName
    }
    
    static func getFriends(count: Int) -> [FriendFake] {
        var friends: [FriendFake] = []
        for _ in 0...count {
            let imagesCount = Int.random(in: 1...7)
            var images: [String] = []
            for _ in 0...imagesCount {
                images.append(String(Int.random(in: 1...20)))
            }
            friends.append(
                FriendFake(
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
