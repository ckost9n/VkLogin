//
//  UIStackView + Extension.swift
//  VkLogin
//
//  Created by Konstantin on 29.06.2022.
//

import UIKit

extension UIStackView {
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: views)
        self.alignment = .center
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
