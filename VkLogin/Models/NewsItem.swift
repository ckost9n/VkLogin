//
//  NewsItem.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import Foundation

struct NewsItem {
    
    let autorName: String
    let date: Date
    let avatarString: String
    let text: String
    let imageString: String
//    let likeCount: Int
    
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
