//
//  NewsViewController.swift
//  VkLogin
//
//  Created by Konstantin on 05.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsDisplayLogic: AnyObject {
    func displayData(viewModel: News.Model.ViewModel.ViewModelData)
}

class NewsViewController: UIViewController, NewsDisplayLogic {
    
    var interactor: NewsBusinessLogic?
    var router: (NSObjectProtocol & NewsRoutingLogic)?
    
    private var news: [NewsItem] = []
    private var tableView = UITableView()
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = NewsInteractor()
        let presenter             = NewsPresenter()
        let router                = NewsRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.makeRequest(request: .getNews)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
        setConstraints()
        
        
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Новости"
        
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
    
    func displayData(viewModel: News.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
        case .displayNews(news: let newsData):
            news = newsData
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.selectionStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell.rawValue, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
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
