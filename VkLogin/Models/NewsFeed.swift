//
//  NewsFeed.swift
//  VkLogin
//
//  Created by Konstantin on 05.08.2022.
//

import Foundation

// MARK: - NewsFeed
struct NewsFeed: Decodable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let items: [Item]
    let profiles: [Profile]
    let groups: [Group]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }
}

enum GroupType: String, Codable {
    case group = "group"
    case page = "page"
}

// MARK: - Item

struct NewsItemNew: Codable {
    let sourceID: Int
    let postId: Int
    let text: String?
    let date: Int
    let comments: CountebleItem?
    let likes: CountebleItem?
    let reposts : CountebleItem?
    let views: CountebleItem?
    
    let imageString: String?
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case postId = "post_id"
        case text, date
        case comments, likes, reposts, views
        case imageString
    }
}

struct CountebleItem: Codable {
    let  count: Int
}

struct Item: Codable {
    let sourceID, date: Int
    let canDoubtCategory, canSetCategory: Bool?
    let isFavorite: Bool
    let postType: PostTypeEnum
    let text: String
    let markedAsAds: Int?
//    let attachments: [ItemAttachment]?
    let postSource: PostSource
    let comments: Comments
    let likes: Likes
    let reposts: Reposts
    let views: Views
    let donut: Donut
    let shortTextRate: Double
    let postID: Int
    let type: PostTypeEnum
    let carouselOffset: Int?
    let zoomText: Bool?
    let categoryAction: CategoryAction?
    let copyHistory: [CopyHistory]?
    let signerID: Int?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case canDoubtCategory = "can_doubt_category"
        case canSetCategory = "can_set_category"
        case isFavorite = "is_favorite"
        case postType = "post_type"
        case text
        case markedAsAds = "marked_as_ads"
//        case attachments
        case postSource = "post_source"
        case comments, likes, reposts, views, donut
        case shortTextRate = "short_text_rate"
        case postID = "post_id"
        case type
        case carouselOffset = "carousel_offset"
        case zoomText = "zoom_text"
        case categoryAction = "category_action"
        case copyHistory = "copy_history"
        case signerID = "signer_id"
    }
}



// MARK: - Doc
struct Doc: Codable {
    let id, ownerID: Int
    let title: String
    let size: Int
    let ext: String
    let date, type: Int
    let url: String
    let accessKey: String

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case title, size, ext, date, type, url
        case accessKey = "access_key"
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String
    let title: String
    let caption: String?
    let linkDescription: String
    let photo: Photo?
    let target: String?
    let isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case url, title, caption
        case linkDescription = "description"
        case photo, target
        case isFavorite = "is_favorite"
    }
}

enum AttachmentType: String, Codable {
    case doc = "doc"
    case link = "link"
    case photo = "photo"
    case video = "video"
}

// MARK: - Video
struct Video: Codable {
    let accessKey: String?
    let canComment, canLike, canRepost, canSubscribe: Int
    let canAddToFaves, canAdd, comments, date: Int
    let videoDescription: String
    let duration: Int
    let image, firstFrame: [Size]
    let width, height, id, ownerID: Int
    let title: String
    let isFavorite: Bool
    let trackCode, type: String
    let views: Int
    let videoRepeat: Int?

    enum CodingKeys: String, CodingKey {
        case accessKey = "access_key"
        case canComment = "can_comment"
        case canLike = "can_like"
        case canRepost = "can_repost"
        case canSubscribe = "can_subscribe"
        case canAddToFaves = "can_add_to_faves"
        case canAdd = "can_add"
        case comments, date
        case videoDescription = "description"
        case duration, image
        case firstFrame = "first_frame"
        case width, height, id
        case ownerID = "owner_id"
        case title
        case isFavorite = "is_favorite"
        case trackCode = "track_code"
        case type, views
        case videoRepeat = "repeat"
    }
}

// MARK: - CategoryAction
struct CategoryAction: Codable {
    let action: Action
    let name: String
}

// MARK: - Action
struct Action: Codable {
    let target, type, url: String
}

// MARK: - Comments
struct Comments: Codable {
    let canPost, count: Int
    let groupsCanPost: Bool?

    enum CodingKeys: String, CodingKey {
        case canPost = "can_post"
        case count
        case groupsCanPost = "groups_can_post"
    }
}

// MARK: - CopyHistory
struct CopyHistory: Codable {
    let id, ownerID, fromID, date: Int
    let postType, text: String
    let attachments: [CopyHistoryAttachment]
    let postSource: PostSource

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case fromID = "from_id"
        case date
        case postType = "post_type"
        case text, attachments
        case postSource = "post_source"
    }
}

// MARK: - CopyHistoryAttachment
struct CopyHistoryAttachment: Codable {
    let type: String
    let photo: Photo?
    let audio: Audio?
    let video: Video?
}

// MARK: - Audio
struct Audio: Codable {
    let artist: String
    let id, ownerID: Int
    let title: String
    let duration: Int
    let isExplicit, isFocusTrack: Bool
    let trackCode: String
    let url: String
    let date, albumID: Int
    let mainArtists: [MainArtist]
    let shortVideosAllowed, storiesAllowed, storiesCoverAllowed: Bool

    enum CodingKeys: String, CodingKey {
        case artist, id
        case ownerID = "owner_id"
        case title, duration
        case isExplicit = "is_explicit"
        case isFocusTrack = "is_focus_track"
        case trackCode = "track_code"
        case url, date
        case albumID = "album_id"
        case mainArtists = "main_artists"
        case shortVideosAllowed = "short_videos_allowed"
        case storiesAllowed = "stories_allowed"
        case storiesCoverAllowed = "stories_cover_allowed"
    }
}

// MARK: - MainArtist
struct MainArtist: Codable {
    let name, domain, id: String
    let isFollowed, canFollow: Bool

    enum CodingKeys: String, CodingKey {
        case name, domain, id
        case isFollowed = "is_followed"
        case canFollow = "can_follow"
    }
}

// MARK: - PostSource
struct PostSource: Codable {
    let platform: String?
    let type: PostSourceType
}

enum PostSourceType: String, Codable {
    case api = "api"
    case vk = "vk"
}

// MARK: - Donut
struct Donut: Codable {
    let isDonut: Bool

    enum CodingKeys: String, CodingKey {
        case isDonut = "is_donut"
    }
}

// MARK: - Likes
struct Likes: Codable {
    let canLike, count, userLikes, canPublish: Int

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case count
        case userLikes = "user_likes"
        case canPublish = "can_publish"
    }
}

enum PostTypeEnum: String, Codable {
    case post = "post"
}

// MARK: - Reposts
struct Reposts: Codable {
    let count, userReposted: Int

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

// MARK: - Views
struct Views: Codable {
    let count: Int
}

// MARK: - Profile
struct Profile: Codable {
    let id, sex: Int
    let photo50, photo100: String
    let onlineInfo: OnlineInfo
    let online: Int
    let deactivated: String?
    let firstName, lastName: String
    let screenName: String?
    let canAccessClosed, isClosed: Bool?
    let onlineMobile, onlineApp: Int?

    enum CodingKeys: String, CodingKey {
        case id, sex
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case onlineInfo = "online_info"
        case online, deactivated
        case firstName = "first_name"
        case lastName = "last_name"
        case screenName = "screen_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case onlineMobile = "online_mobile"
        case onlineApp = "online_app"
    }
}

// MARK: - OnlineInfo
struct OnlineInfo: Codable {
    let visible, isOnline, isMobile: Bool
    let lastSeen, appID: Int?

    enum CodingKeys: String, CodingKey {
        case visible
        case isOnline = "is_online"
        case isMobile = "is_mobile"
        case lastSeen = "last_seen"
        case appID = "app_id"
    }
}
