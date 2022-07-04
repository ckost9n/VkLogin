//
//  SliderPhotoCell.swift
//  VkLogin
//
//  Created by Konstantin on 04.07.2022.
//

import UIKit

class SliderPhotoCell: UICollectionViewCell, UIScrollViewDelegate {
    
    private let photoImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let photoScrollView: UIScrollView = {
        let element = UIScrollView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        photoScrollView.delegate = self
        addSubview(photoScrollView)
        photoScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        photoScrollView.minimumZoomScale = 1.0
        photoScrollView.maximumZoomScale = 3.5
        photoScrollView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        photoScrollView.snp.makeConstraints { make in
            make.width.height.equalTo(photoImageView)
        }
    }
    
    func configure(photoString: String) {
        let image = UIImage(named: "Avatars/" + photoString)
        
        photoImageView.image = image
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
