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
}

class VkNetworkService {
    
    func getData(metod: VkMethod, completion: @escaping ([Friend]) -> Void) {
        
        let urlPath = "https://api.vk.com/method/" + metod.rawValue
        let parameters: Parameters = [
            "access_token": Constants.acssestoken.rawValue,
            "v": "5.131",
            "fields": "domain, photo_50"
        ]
        
        AF.request(urlPath, parameters: parameters).responseDecodable(of: FriendItem.self) { response in
            guard let friends = response.value?.response.items else { return }
            completion(friends)
        
//        switch metod {
//        case .friends:
//            AF.request(urlPath, parameters: parameters).responseDecodable(of: FriendItem.self) { response in
//                guard let friends = response.value?.response.items else { return }
//                completion(friends)
//            }
//        case .photos:
//            <#code#>
//        case .groups:
//            <#code#>
//        case .groupSearch:
//            <#code#>
//        }
        
//        private func getDataForModel<T: Decodable>(model: T) {
//            AF.request(urlPath, parameters: parameters).responseDecodable(of: T.self) { response in
////                guard let friends = response.value?.response.items else { return }
////                completion(friends)
//            }
        }
        
    }
    
}
