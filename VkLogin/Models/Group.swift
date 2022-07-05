//
//  Group.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

// MARK: - Welcome
struct GroupItem: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: TypeEnum
    let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}

struct GroupFake {
    let name: String
    let avatarString: String
    let imagesString: [String]
    
    static func getGroup(count: Int) -> [GroupFake] {
        var friends: [GroupFake] = []
        for _ in 0...count {
            let imagesCount = Int.random(in: 1...7)
            var images: [String] = []
            for _ in 0...imagesCount {
                images.append(String(Int.random(in: 1...20)))
            }
            friends.append(
                GroupFake(
                    name: Lorem.firstName,
                    avatarString: String(Int.random(in: 1...20)),
                    imagesString: images
                )
            )
        }
        return friends
    }
}
