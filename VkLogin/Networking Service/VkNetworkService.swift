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
            
            guard let dictResponse = try! JSONSerialization.jsonObject(with: myData, options: .fragmentsAllowed) as? [String: Any] else { return }
            guard let dataResponse = dictResponse["response"] as? [String: Any] else { return }
            let dispatchGroup = DispatchGroup()

            for dataItem in dataResponse {
                guard let categoryData = try? JSONSerialization.data(withJSONObject: [dataItem.value]) else { return }
                
//                dispatchGroup.enter()
                DispatchQueue.global().async(group: dispatchGroup) {
                    switch dataItem.key {
                    case "items":
                        guard let items = try? JSONDecoder().decode([[NewsItemNew]].self, from: categoryData) else { return }
                        newsArr = items[0]
                        print(items[0][0].postId)
                    case "groups":
                        guard let groups = try? JSONDecoder().decode([[GroupItem]].self, from: categoryData) else { return }
                        print(groups)
                        groupArr = groups[0]
                    case "profiles":
                        guard let profile = try? JSONDecoder().decode([[ProfileItem]].self, from: categoryData) else { return }
                        print(profile)
                        profileArr = profile[0]
                    default:
                        break
                    }
//                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.notify(queue: DispatchQueue.main) { 
                completion(profileArr, groupArr, newsArr)
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
    
}
