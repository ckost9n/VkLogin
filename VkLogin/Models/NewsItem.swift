//
//  NewsItem.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

enum ItemsOfCell {
    case top
    case text
    case image
    case bottom
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
    
    func getInfoCell(index: Int) -> ItemsOfCell? {
        switch index {
        case 0: return .top
        case 1: return text != nil ? .text : .image
        case 2: return imageString != nil ? .image : .bottom
        case 3: return .bottom
        default: return nil
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
