//
//  NewsViewController.swift
//  VkLogin
//
//  Created by Konstantin on 02.07.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var news: [NewsItem] = []
    
    private let tableView: UITableView = {
        let element = UITableView()
        
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

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
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: Constants.newsCell.rawValue)
        setDelegates()
        
        view.addSubview(tableView)
//        tableView.separatorStyle = .none
//        navigationItem.searchController = searchController
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
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

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.selectionStyle = .default
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell.rawValue, for: indexPath) as! NewsCell
        
        let model = news[indexPath.row]
        cell.configure(newsItem: model)
        
        return cell
    }
    
    
}

// MARK: - Set Constraints

extension NewsViewController {
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
//            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
}

