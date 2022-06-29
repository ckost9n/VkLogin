//
//  LoginViewController.swift
//  VkLogin
//
//  Created by Konstantin on 29.06.2022.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let vkLabel: UILabel = {
        let element = UILabel()
        element.text = "VK"
        element.font = .boldSystemFont(ofSize: 45)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let loginLabel = UILabel(text: "Логин")
    private let passwordLabel = UILabel(text: "Пароль")
    
    private let loginTextField = UITextField(cornerRadius: 0)
    private let passwordTextField = UITextField(cornerRadius: 0)
    
    private lazy var enterButton: UIButton = {
        let element = UIButton(type: .system)
        
//        var configuration = UIButton.Configuration()
//
//        element.configuration
        element.titleLabel?.text = "Вход"
        element.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        setupViews()
        
    }
    
    @objc private func enterButtonTapped() {
        print("Tap")
    }

    private func setupViews() {
        mainStackView = UIStackView(views: [
            vkLabel,
            loginLabel,
            loginTextField,
            passwordLabel,
            passwordTextField,
            enterButton
        ], axis: .vertical, spacing: 15)
        view.addSubview(mainStackView)
        setConstraints()
    }
}


extension LoginViewController {
    private func setConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
    }
}
