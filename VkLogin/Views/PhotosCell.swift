//
//  PhotosCell.swift
//  VkLogin
//
//  Created by Konstantin on 04.07.2022.
//

import UIKit


class PhotosCell: UICollectionViewCell {
    
    private let photoImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(photoString: String) {
        let image = UIImage(named: "Avatars/" + photoString)
        
        photoImageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
