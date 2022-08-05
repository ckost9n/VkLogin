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
    
    func makeRequest(request: News.Model.Request.RequestType) {
        if service == nil {
            service = NewsService()
        }
        
        switch request {
            
        case .getNews:
            
            networkService.getNews { profile, groups, news in
                print(profile[0].firstName)
                print(groups[0].name)
                print(news[0].postId)
            }
            presenter?.presentData(response: .presentNews)
        }
    }
    
}
