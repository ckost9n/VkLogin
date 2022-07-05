//
//  AllGroupViewController.swift
//  VkLogin
//
//  Created by Konstantin on 03.07.2022.
//

import UIKit

protocol GetCurrentGroupProtocol {
    func getCurrentGroup(currentGroup: GroupFake)
}


class AllGroupViewController: UIViewController {
    
    // MARK: - Create Views
    
    private let searchController = UISearchController()
    
    private let tableView: UITableView = {
        let element = UITableView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Properties
    
    private var group: [GroupFake] = []
    private var groups: [Group] = []
    
    var delegate: GetCurrentGroupProtocol?
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        
        group = GroupFake.getGroup(count: 10)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Группы"
        
        tableView.register(GroupCell.self, forCellReuseIdentifier: Constants.groupCell.rawValue)
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

extension AllGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentGroup = group[indexPath.row]
        
        delegate?.getCurrentGroup(currentGroup: currentGroup)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.groupCell.rawValue, for: indexPath) as! GroupCell
        
        let model = groups[indexPath.row]
        cell.configure(group: model)
        
        return cell
    }
    
    
}

// MARK: - Set Constraints

extension AllGroupViewController {
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
}

