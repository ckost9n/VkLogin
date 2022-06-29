//
//  UITextField + Extension.swift
//  VkLogin
//
//  Created by Konstantin on 29.06.2022.
//

import UIKit

extension UITextField {
    convenience init(cornerRadius: CGFloat) {
        self.init()
//        self.borderStyle = .none
        self.layer.cornerRadius = cornerRadius
        self.clearButtonMode = .always
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
