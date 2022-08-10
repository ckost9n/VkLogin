//
//  NewsInteractor.swift
//  VkLogin
//
//  Created by Konstantin on 05.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsBusinessLogic {
    func makeRequest(request: News.Model.Request.RequestType)
}

class NewsInteractor: NewsBusinessLogic {
    
    var presenter: NewsPresentationLogic?
    var service: NewsService?
    
    
    private var networkService = VkNetworkService()
    private var newsResponse: ([ProfileItem]?, [GroupItem]?, [NewsItemNew]?) {
        didSet {
            
            guard
                let profileItem = newsResponse.0,
                let groupItem = newsResponse.1,
                let newsItem = newsResponse.2
            else { return }
            presenter?.presentData(response: .presentNews(news: newsItem, profile: profileItem, group: groupItem))
        }
    }
//    private var response: ResponseData? {
//        didSet {
//            guard let response = response else {
//                return
//            }
//            presenter?.presentData(response: .presentNewsFeed(news: response))
//
//        }
//    }
    
    func makeRequest(request: News.Model.Request.RequestType) {
        if service == nil {
            service = NewsService()
        }
        
        switch request {
            
        case .getNews:
            
//            networkService.getNewsAl { [weak self] response in
//                guard let self = self else { return }
//                self.response = response
//            }
            
            
            networkService.getNews { [weak self] profile, groups, news in
                guard let self = self else { return }
                print(profile[0].firstName)
                print(groups[0].name)
                print(news[0].postId)
                self.newsResponse = (profile, groups, news)
//                self.news = news
            }
            
//            presenter?.presentData(response: .presentNews)
        }
    }
    
}
