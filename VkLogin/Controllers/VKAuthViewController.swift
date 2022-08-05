//
//  VKAuthViewController.swift
//  VkLogin
//
//  Created by Konstantin on 05.07.2022.
//

import UIKit
import WebKit

class VKAuthViewController: UIViewController {

    private let webView: WKWebView = {
        let element = WKWebView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        view.addSubview(webView)
        setupViews()
        
        loadVKAuth()
    }
    

    func loadVKAuth() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.idApp.rawValue),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "8194"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        print("12134")
        guard let url = components.url else { return }
//        print(url)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    private func setupViews() {
        
        view.backgroundColor = .white
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension VKAuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
                 WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) ->
                 Void) {
        guard let url = navigationResponse.response.url, url.path ==
                "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        guard let token = params["access_token"] else { return }
        Constants.token = token
//        print("my token = \(token)")
        decisionHandler(.cancel)
        
        let mainTabBatVC = MainTabBarCotroller()
        mainTabBatVC.modalTransitionStyle = .coverVertical
        mainTabBatVC.modalPresentationStyle = .fullScreen
        self.present(mainTabBatVC, animated: true)
    }
}
