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
    
    func getData<T: Decodable>(metod: VkMethod, userId: String? = nil, completion: @escaping ([T]) -> Void) {
        
        let urlPath = "https://api.vk.com/method/" + metod.rawValue
        var parameters: Parameters = [
            "access_token": Constants.acssestoken.rawValue,
            "v": "5.131"
        ]
        
        switch metod {
        case .friends:
            parameters["fields"] = "domain, photo_50"
        case .photos:
            parameters["owner_id"] = userId
        case .groups:
            parameters["extended"] = "1"
        case .groupSearch:
            break
        }
        
        AF.request(urlPath, parameters: parameters).responseDecodable(of: VkResponse<T>.self) { response in
            guard let data = response.value?.items else { return }
            completion(data)
        }
        
    }
    
}
