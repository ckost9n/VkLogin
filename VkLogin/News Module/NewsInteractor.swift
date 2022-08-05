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
  
  func makeRequest(request: News.Model.Request.RequestType) {
    if service == nil {
      service = NewsService()
    }
  }
  
}