//
//  PhotosViewController.swift
//  VkLogin
//
//  Created by Konstantin on 04.07.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var photosString: [String]?
    
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private let photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let element = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.showsHorizontalScrollIndicator = false
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    

    private func setupView() {
        view.backgroundColor = .white
        photosCollectionView.register(PhotosCell.self, forCellWithReuseIdentifier: Constants.photoCell.rawValue)
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        view.addSubview(photosCollectionView)
    }

}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widrhPerItem = availableWidth / itemsPerRow
        return CGSize(width: widrhPerItem, height: widrhPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sliderVC = SliderViewController()
        sliderVC.modalPresentationStyle = .fullScreen
        sliderVC.modalTransitionStyle = .partialCurl
        sliderVC.indexPath = indexPath
        sliderVC.title = title
        sliderVC.imagesString = photosString
        
        navigationController?.pushViewController(sliderVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosString?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCell.rawValue, for: indexPath) as! PhotosCell
        
        guard let model = photosString?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(photoString: model)
        
        return cell
    }
    
}

extension PhotosViewController {
    
    private func setConstraints() {
        
        photosCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
