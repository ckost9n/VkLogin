//
//  NewsViewController.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var news: [NewsItem] = []
    
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        
        news = NewsItem.getNews(count: 30)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Новости"
//        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        
        tableView.register(NewsHeaderCell.self, forCellReuseIdentifier: Constants.newsHeaderCell.rawValue)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.newsCell.rawValue)
        tableView.register(NewsFooterCell.self, forCellReuseIdentifier: Constants.newsFooterCell.rawValue)
        setDelegates()
        
        view.addSubview(tableView)
        tableView.separatorStyle = .none
//        navigationItem.searchController = searchController
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.selectionStyle = .none
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = NewsHeaderView()
//        header.configure(model: news[section])
//        return header
//    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = NewsFooterView()
////        footer.configure(model: news[section])
//        return footer
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell.rawValue, for: indexPath)
        var content = cell.defaultContentConfiguration()
//
        let model = news[indexPath.section]
        guard let index = model.getInfoCell(index: indexPath.row) else { return UITableViewCell() }
        
        switch index {
        
        case .top:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsHeaderCell.rawValue, for: indexPath) as! NewsHeaderCell
            cell.configure(model: model)
            return cell
        case .text:
            content.text = model.text
        case .image:
            content.image = UIImage(named: "Thumbnails/" + (model.imageString ?? "0"))
        case .bottom:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsFooterCell.rawValue, for: indexPath) as! NewsFooterCell
            return cell
        }

//        if indexPath.row == 0 {
//            if model.text != nil {
//                content.text = model.text
//            } else {
//                content.image = UIImage(named: "Thumbnails/" + (model.imageString ?? "0"))
//            }
//        } else {
//            content.image = UIImage(named: "Thumbnails/" + (model.imageString ?? "0"))
//        }
//
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

// MARK: - Set Constraints

extension NewsViewController {
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

