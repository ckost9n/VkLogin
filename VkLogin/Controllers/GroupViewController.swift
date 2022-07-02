//
//  GroupViewController.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit

class GroupViewController: UIViewController {
    
    // MARK: - Create Views
    
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
        
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Группы"
        
        tableView.register(GroupCell.self, forCellReuseIdentifier: Constants.groupCell.rawValue)
        setDelegates()
        
        view.addSubview(tableView)
        navigationItem.searchController = searchController
        
        group = Group.getGroup(count: 10)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    
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

extension GroupViewController {
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
}
