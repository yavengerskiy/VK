//
//  PhotosCollectionViewCell.swift
//  VK
//
//  Created by Beelab on 24/01/22.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    func clearCell() {
        photoImage.image = nil
    }
    
    func setImage(imageName: String){
        photoImage.image = UIImage(named: imageName)
    }
}
