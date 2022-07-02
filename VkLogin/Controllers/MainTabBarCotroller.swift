//
//  MainTabBarCotroller.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit

class MainTabBarCotroller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let friendsVC = createNavController(vc: FriendsViewController(), itemName: "Друзья", itemImageName: "person.3.sequence.fill")
        let groupVC = createNavController(vc: GroupViewController(), itemName: "Группы", itemImageName: "rectangle.stack.badge.person.crop.fill")
        let newsVC = createNavController(vc: NewsViewController(), itemName: "Новости", itemImageName: "captions.bubble")
        
        viewControllers = [friendsVC, groupVC, newsVC]
        
    }
    
    
    private func createNavController(vc: UIViewController, itemName: String, itemImageName: String) -> UINavigationController {
        
        let itemImage = UIImage(systemName: itemImageName)
        
        let item = UITabBarItem(title: itemName, image: itemImage, tag: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
}
