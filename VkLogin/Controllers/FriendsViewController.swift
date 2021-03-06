//
//  FriendsViewController.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit
import SnapKit

class FriendsViewController: UIViewController {
    
    // MARK: - Create Views
    
    private let searchController = UISearchController()
    
    private let tableView: UITableView = {
        let element = UITableView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Properties
    
    private var friends: [Friend] = []
//    private var friends
    
    private var networkService = VkNetworkService()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        networkService.getData(metod: .friends) { [weak self] (friends: [Friend]) in
            guard let self = self else { return }
//            guard let friends = friendItem.response.items else { return }

            self.friends = friends

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
        }

    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Друзья"
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.friendCell.rawValue)
        setDelegates()
        
        view.addSubview(tableView)
        navigationItem.searchController = searchController   
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        let currentFriend = friends[indexPath.row]
        
        let photosVC = PhotosViewController()
        photosVC.modalTransitionStyle = .crossDissolve
        photosVC.modalPresentationStyle = .fullScreen
        photosVC.userId = currentFriend.id
//        photosVC.photosString = currentFriend.imagesString
        photosVC.title = currentFriend.firstName + " " + currentFriend.lastName
        
        navigationController?.pushViewController(photosVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.friendCell.rawValue, for: indexPath) as! FriendCell
        
        let friend = friends[indexPath.row]
        cell.configure(friend: friend)
        
        return cell
    }
    
    
}

// MARK: - Set Constraints

extension FriendsViewController {
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
}
