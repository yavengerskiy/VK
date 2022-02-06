//
//  FriendsListTableViewCell.swift
//  VK
//
//  Created by Beelab on 30/01/22.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let shadowRadius:CGFloat = 5
    let shadowColor = UIColor.black.cgColor
    let shadowOffset = CGSize(width: 5, height: 5)
    let shadowOpacity:Float = 0.5

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        clearCel()
    }

    private func setupCell() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        backView.layer.cornerRadius = backView.frame.height / 2
        backView.layer.shadowColor = shadowColor
        backView.layer.shadowRadius = shadowRadius
        backView.layer.shadowOffset = shadowOffset
        backView.layer.shadowOpacity = shadowOpacity
    }
    
    private func clearCel() {
        avatarImageView.image = nil
        titleLabel.text = nil
        
    }
    
    func setDataForCell(user: User ) {
        self.avatarImageView.image = UIImage(named: user.photos.first ?? "")
        self.titleLabel.text = user.name
    }
}
