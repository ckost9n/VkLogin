//
//  MyGroupViewController.swift
//  VkLogin
//
//  Created by Konstantin on 03.07.2022.
//

import UIKit

class MyGroupViewController: UIViewController {
    
    // MARK: - Create Views
    
    private lazy var addNewGroup: UIBarButtonItem = {
        let element = UIBarButtonItem(systemItem: .add)
        element.target = self
        element.action = #selector(addNewGroupTapped)
        return element
    }()
    
    private let searchController = UISearchController()
    
    private let tableView: UITableView = {
        let element = UITableView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    // MARK: - Properties
    
    private var group: [Group] = []
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        
//        group = Group.getGroup(count: 10)
//
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            self.tableView.reloadData()
//        }
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Группы"
        
        tableView.register(GroupCell.self, forCellReuseIdentifier: Constants.groupCell.rawValue)
        setDelegates()
        
        view.addSubview(tableView)
        navigationItem.searchController = searchController
        
        navigationItem.rightBarButtonItem = addNewGroup
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @objc private func addNewGroupTapped() {
        
        let destinationVC = AllGroupViewController() 
        destinationVC.modalTransitionStyle = .coverVertical
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.delegate = self
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}

// MARK: - GetCurrentGroupProtocol

extension MyGroupViewController: GetCurrentGroupProtocol {
    
    func getCurrentGroup(currentGroup: Group) {
        group.append(currentGroup)
        print(group)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
      
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        group.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.groupCell.rawValue, for: indexPath) as! GroupCell
        
        let model = group[indexPath.row]
        cell.configure(group: model)
        
        return cell
    }
    
    
}

// MARK: - Set Constraints

extension MyGroupViewController {
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
}

