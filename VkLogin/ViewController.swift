//
//  ViewController.swift
//  VkLogin
//
//  Created by Konstantin on 29.06.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let myView: UIView = {
        let element = UIView()
        element.backgroundColor = .orange
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(myView)
        
        setConstraints()
    }


}


extension ViewController {
    private func setConstraints() {
        myView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(200)
        }
    }
}
