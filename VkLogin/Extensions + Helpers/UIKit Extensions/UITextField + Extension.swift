//
//  UITextField + Extension.swift
//  VkLogin
//
//  Created by Konstantin on 29.06.2022.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
//        self.backgroundColor = .systemBlue
        self.returnKeyType = .done
//        self.layer.cornerRadius = 5
//        self.clipsToBounds = true
//        self.clearButtonMode = .always
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
