//
//  UILabel + Extesion.swift
//  VkLogin
//
//  Created by Konstantin on 29.06.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
