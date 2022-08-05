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
          case presentNews
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNews(news: [NewsItem])
      }
    }
  }
  
}
