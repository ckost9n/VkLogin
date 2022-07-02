//
//  FriendsViewController.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Друзья"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FriendsViewController {
    
    private func setConstraints() {
        
    }
    
}
