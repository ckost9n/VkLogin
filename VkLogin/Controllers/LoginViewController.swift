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
    
    private let loginTextField = UITextField(placeholder: "Login")
    private let passwordTextField = UITextField(placeholder: "Password")
    
    private lazy var enterButton: UIButton = {
        let element = UIButton(type: .system)
        
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .large
//        configuration.baseForegroundColor = .blue
        var text = AttributeContainer()
        configuration.attributedTitle = AttributedString("Вход", attributes: text)

        element.configuration = configuration
        element.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    
    private var labelStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        
    }
    
    @objc private func enterButtonTapped() {
        let vc = MainTabBarCotroller()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    private func setupViews() {
        labelStackView = UIStackView(views: [
            loginLabel,
            loginTextField,
            passwordLabel,
            passwordTextField
        ], axis: .vertical, spacing: 15)
        mainStackView = UIStackView(views: [
            vkLabel,
            labelStackView,
            enterButton
        ], axis: .vertical, spacing: 40)
        view.addSubview(mainStackView)
        setConstraints()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
}


extension LoginViewController {
    private func setConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview().offset(-75)
        }
        loginTextField.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(50)
        }
        enterButton.snp.makeConstraints { make in
            make.width.equalTo(loginTextField.snp.width).multipliedBy(0.6)
            make.height.equalTo(50)
        }
    }
}
