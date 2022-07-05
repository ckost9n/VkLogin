//
//  Photo.swift
//  VkLogin
//
//  Created by Konstantin on 05.07.2022.
//

import Foundation

// MARK: - Welcome
struct PhotoItem: Codable {
    let response: ResponsePhoto
}

// MARK: - Response
struct ResponsePhoto: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable {
    let albumID, date, id, ownerID: Int
    let sizes: [Size]
    let text: Text
    let hasTags: Bool
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case sizes, text
        case hasTags = "has_tags"
        case postID = "post_id"
    }
}

// MARK: - Size
struct Size: Codable {
    let height: Int
    let url: String
//    let type: TypeEnum
    let width: Int
}

//enum TypeEnum: String, Codable {
//    case m = "m"
//    case o = "o"
//    case p = "p"
//    case q = "q"
//    case r = "r"
//    case s = "s"
//    case w = "w"
//    case x = "x"
//    case y = "y"
//    case z = "z"
//}

enum Text: String, Codable {
    case digitalResistance = "DIGITAL RESISTANCE"
    case empty = ""
    case originalHTTPSWWWInstagramCOMDurov = "Original: https://www.instagram.com/durov/"
    case сАнтономНосикомВВенецииВЯнваре2015Года = "С Антоном Носиком в Венеции в январе 2015 года."
}
