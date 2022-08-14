//
//  NewsItem.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

enum ItemsOfCell {
    case top
    case central
//    case text
//    case image
    case bottom
}

enum CenterOfCell {
    case empty
    case text
    case photo
    case textPlusPhoto
}

protocol FeedCellViewModel {
    var avatarUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String { get }
    var comments: String { get }
    var shares: String { get }
    var views: String { get }
    
    var photoAttachments: FeedCellPhotoAttachmentsViewModel? { get }
    
    var count: Int { get }
    
    func getInfoCell(index: Int) -> ItemsOfCell?
}

protocol FeedCellPhotoAttachmentsViewModel {
    var photoUrlString: String? { get }
    var width: Int { get }
    var height: Int { get }
}

struct NewsItem {
    
    let autorName: String
    let date: Date
    let avatarString: String
    let text: String?
    let imageString: String?
//    let likeCount: Int
    
    var count: Int {
        var myCount = 2
        if text != nil { myCount += 1 }
        if imageString != nil { myCount += 1 }
        return myCount
//        return 4
    }
    
    func checkCentral() -> CenterOfCell {
        if text == nil, imageString == nil {
            return .empty
        } else if imageString == nil {
            return .text
        } else if text == nil {
            return .photo
        } else {
            return .textPlusPhoto
        }
        
    }

    
    static func getNews(count: Int) -> [NewsItem] {
        
        var news: [NewsItem] = []
        
        for _ in 0...count {
            //            let imagesCount = Int.random(in: 1...7)
            //            var images: [String] = []
            //            for _ in 1...imagesCount {
            //                images.append(String(Int.random(in: 1...20)))
            //            }
            
            news.append(
                NewsItem(
                    autorName: Lorem.fullName,
                    date: Date(),
                    avatarString: String(Int.random(in: 1...20)),
                    text: Lorem.words(20...100),
                    imageString: String(Int.random(in: 1...5))
                )
            )
        }
        
        return news
        
    }
    
}
