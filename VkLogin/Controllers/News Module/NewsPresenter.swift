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
    
    let dateFormater: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
  
  func presentData(response: News.Model.Response.ResponseType) {
      
      switch response {
          
      case .presentNews(news: let news, profile: let profile, group: let group):
          let cells = news.map { feedItem in
              cellViewModel(from: feedItem, profile: profile, group: group)
          }

          let feedModel = FeedViewModel.init(cells: cells)
          viewController?.displayData(viewModel: .displayNews(news: feedModel))
      case .presentNewsFeed(news: let news):
          let cells = news.items.map { feedItem in
              cellViewModel(from: feedItem, profile: news.profiles, group: news.groups)
          }

          let _ = FeedViewModel.init(cells: cells)
//          viewController?.displayData(viewModel: .displayNews(news: feedModel))
      }
  }
    
    private func cellViewModel(from feedItem: NewsItemNew, profile: [ProfileItem], group: [GroupItem]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceID, profiles: profile, groups: group)
        
        let photoAttachment = photoAttachment(feedItem: feedItem)
        
        let date = Date(timeIntervalSince1970: TimeInterval(feedItem.date))
        let feedTitle = dateFormater.string(from: date)
        
        return FeedViewModel.Cell.init(
            avatarUrlString: profile.photo,
            name: profile.name,
            date: feedTitle,
            text: feedItem.text,
            likes: String(feedItem.likes?.count ?? 0),
            comments: String(feedItem.comments?.count ?? 0),
            shares: String(feedItem.reposts?.count ?? 0),
            views: String(feedItem.views?.count ?? 0),
            photoAttachments: photoAttachment
        )
    }
    
    private func profile(for sourceId: Int, profiles: [ProfileItem], groups: [GroupItem]) -> ProfileRepresentable {
        
        let profilesOrGroups: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
        let normalSourseId = sourceId  >= 0 ? sourceId : -sourceId
        let profileRepresenteble = profilesOrGroups.first { myProfileRepresenteble in
            myProfileRepresenteble.id == normalSourseId
        }
        return profileRepresenteble!
    }
    
    private func photoAttachment(feedItem: NewsItemNew) -> FeedViewModel.FeedCellPhotoAttachments? {
        guard let photos = feedItem.attachments?.compactMap({ attachment in
            attachment.photo
        }), let firstPhoto = photos.first else { return nil }
        return FeedViewModel.FeedCellPhotoAttachments.init(
            photoUrlString: firstPhoto.url,
            width: firstPhoto.width,
            height: firstPhoto.height
        )
    }
  
}
