//
//  SliderViewController.swift
//  VkLogin
//
//  Created by Konstantin on 04.07.2022.
//

import UIKit
import SnapKit

class SliderViewController: UIViewController {
    
    var indexPath: IndexPath!
    var imagesString: [String]!
    
    private let photoImageView: UIImageView = {
        let element = UIImageView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let element = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.showsHorizontalScrollIndicator = false
        element.isPagingEnabled = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    

    private func setupView() {
        view.backgroundColor = .white
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        
        photosCollectionView.register(SliderPhotoCell.self, forCellWithReuseIdentifier: Constants.sliderPhotoCell.rawValue)
        
        view.addSubview(photosCollectionView)
        photosCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        photosCollectionView.performBatchUpdates { [weak self] in
            self?.photosCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }

}

extension SliderViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width
        let heightCell = frameCV.height
        
        return CGSize(width: widthCell, height: heightCell)
    }

}

extension SliderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesString?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.sliderPhotoCell.rawValue, for: indexPath) as! SliderPhotoCell
        
        guard let model = imagesString?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(photoString: model)
        
        return cell
    }
    
}
