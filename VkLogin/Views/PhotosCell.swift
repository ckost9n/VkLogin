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
        element.contentMode = .scaleToFill
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
    
    func configure(photo: Photo) {
        
        let stringPhoto = photo.sizes
        let photoSize = stringPhoto.sorted { $0.height > $1.height }
        
        guard let photo = photoSize.first?.url else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let url = URL(string: photo) {
                self?.photoImageView.kf.setImage(with: url)
            }
        }
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
