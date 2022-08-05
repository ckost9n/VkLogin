//
//  NewsPresenter.swift
//  VkLogin
//
//  Created by Konstantin on 05.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsPresentationLogic {
  func presentData(response: News.Model.Response.ResponseType)
}

class NewsPresenter: NewsPresentationLogic {
  weak var viewController: NewsDisplayLogic?
    private var news: [NewsItem] = []
  
  func presentData(response: News.Model.Response.ResponseType) {
      
      switch response {
      case .presentNews:
          news = NewsItem.getNews(count: 30)
          viewController?.displayData(viewModel: .displayNews(news: news))
      }
  }
  
}
