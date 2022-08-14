//
//  VkNetworkService.swift
//  VkLogin
//
//  Created by Konstantin on 05.07.2022.
//

import Foundation
import Alamofire

enum VkMethod: String {
    case friends = "friends.get"
    case photos = "photos.getAll"
    case groups = "groups.get"
    case groupSearch = "groups.search"
    case newsFeed = "newsfeed.get"
}

class VkNetworkService {
    
    func getNewsAl(completion: @escaping (ResponseData) -> Void) {
        
        let urlPath = "https://api.vk.com/method/" + VkMethod.newsFeed.rawValue
        let parameters: Parameters = [
            "access_token": Constants.token,
            "v": "5.131",
            "filters": "post, photo"
        ]
        
        AF.request(urlPath, parameters: parameters).responseDecodable(of: NewsFeed.self) { data in
//                guard let data = response.value?.items else { return }
            guard let response = data.value?.response else { return }
            completion(response)
        }
    }
    
    func getNews(completion: @escaping ([ProfileItem], [GroupItem], [NewsItemNew]) -> Void) {
        let urlPath = "https://api.vk.com/method/" + VkMethod.newsFeed.rawValue
        let parameters: Parameters = [
            "access_token": Constants.token,
            "v": "5.131",
            "filters": "post, photo"
        ]
        
        var profileArr: [ProfileItem] = []
        var groupArr: [GroupItem] = []
        var newsArr: [NewsItemNew] = []
        
        AF.request(urlPath, method: .get, parameters: parameters).response { data in
            
            guard let myData = data.value, let myData = myData else { return }
            
            DispatchQueue.global().async { [weak self] in
                guard let self = self else { return }
                
                let json = (try? JSONSerialization.jsonObject(with: myData, options: .fragmentsAllowed) as? [String: Any]) ?? [:]
                
                let responseData = (json["response"] as? [String: Any]) ?? [:]
                
                let items = responseData["items"]
                let profiles = responseData["profiles"]
                let groups = responseData["groups"]
                
                let itemsData = (try? JSONSerialization.data(withJSONObject: items as Any, options: .fragmentsAllowed)) ?? Data()
                let profilesData = (try? JSONSerialization.data(withJSONObject: profiles as Any, options: .fragmentsAllowed)) ?? Data()
                let groupsData = (try? JSONSerialization.data(withJSONObject: groups as Any, options: .fragmentsAllowed)) ?? Data()
                
                let dispatchGroup = DispatchGroup()
                
                dispatchGroup.enter()
                dispatchGroup.enter()
                dispatchGroup.enter()
                
                self.asyncParse(data: itemsData, group: dispatchGroup) { (model: [NewsItemNew]) in
                    newsArr = model
                }
                
                self.asyncParse(data: profilesData, group: dispatchGroup) { (model: [ProfileItem]) in
                    profileArr = model
                }
                
                self.asyncParse(data: groupsData, group: dispatchGroup) { (model: [GroupItem]) in
                    groupArr = model
                }
                
                dispatchGroup.notify(queue: .global()) {
                    completion(profileArr, groupArr, newsArr)
                }
            }
        }
    }
    
    func getData<T: Decodable>(metod: VkMethod, userId: String? = nil, completion: @escaping ([T]) -> Void) {
        
        let urlPath = "https://api.vk.com/method/" + metod.rawValue
        var parameters: Parameters = [
            "access_token": Constants.token,
            "v": "5.131"
        ]
        
        switch metod {
        case .friends:
            parameters["fields"] = "domain, photo_50"
        case .photos:
            parameters["owner_id"] = userId
        case .groups:
            parameters["extended"] = "1"
        case .newsFeed:
            parameters["filters"] = "post, photo"
            return
        case .groupSearch:
            break
        }
        
        AF.request(urlPath, parameters: parameters).responseDecodable(of: VkResponse<T>.self) { response in
            guard let data = response.value?.items else { return }
            completion(data)
        }
        
    }
    
    private func asyncParse<T: Decodable> (data: Data, group: DispatchGroup, completion: @escaping (T) -> Void) {
        DispatchQueue.global().async {
            if let parseModel = try? JSONDecoder().decode(T.self, from: data) {
                completion(parseModel)
            }
            group.leave()
        }
    }
    
}
