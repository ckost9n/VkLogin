//
//  NewsModels.swift
//  VkLogin
//
//  Created by Konstantin on 05.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum News {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNews
      }
    }
    struct Response {
      enum ResponseType {
          case presentNews(news: [NewsItemNew], profile: [ProfileItem], group: [GroupItem])
          case presentNewsFeed(news: ResponseData)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNews(news: FeedViewModel)
      }
    }
  }
  
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        
        var avatarUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String
        var comments: String
        var shares: String
        var views: String
        
        var photoAttachments: FeedCellPhotoAttachmentsViewModel?
        
        var count: Int {
            var myCount = 2
            if text != nil { myCount += 1 }
            if photoAttachments != nil { myCount += 1 }
            return myCount
    //        return 4
        }
        
        func getInfoCell(index: Int) -> ItemsOfCell? {
            if photoAttachments == nil && text == nil {
                return nil
            }
            switch index {
            case 0: return .top
            case 1: return .central
            case 2: return photoAttachments != nil ? nil : .bottom
            case 3: return .bottom
            default: return nil
            }
        }
    }
    
    struct FeedCellPhotoAttachments: FeedCellPhotoAttachmentsViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}


