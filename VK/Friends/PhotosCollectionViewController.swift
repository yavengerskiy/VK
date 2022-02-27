//
//  PhotosCollectionViewController.swift
//  VK
//
//  Created by Beelab on 24/01/22.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    var photoList: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(UINib(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)


    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(photoList.count)
        return photoList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell
        else { return PhotosCollectionViewCell() }
        
        cell.setImage(imageName: photoList[indexPath.item])
        return cell
        
    }
}
