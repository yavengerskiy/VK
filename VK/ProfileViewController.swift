//
//  ProfileViewController.swift
//  VK
//
//  Created by Beelab on 30/01/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private var likeIsToched = false
    private var likeCounter = 0
    @IBOutlet weak var photiImageView: UIImageView!
    
    @IBOutlet weak var likeBUtton: UIButton!
    
    @IBOutlet weak var likeCounterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addLikeButton()
        photiImageView.layer.cornerRadius = photiImageView.frame.height / 2
        
    }
    
    @IBAction func didPressedLikeButton(_ sender: Any) {
        if likeIsToched {
            setLike(color: .gray, counter: -1)
            
        } else {
            setLike(color: .red,counter: 1)
        }
    }
    
    private func setLike(color: UIColor, counter: Int) {
        likeBUtton.tintColor = color
        likeCounter += counter
        likeCounterLabel.text = "\(likeCounter)"
        likeIsToched.toggle()
    }
    
    
// подумать, не дощло как менять цвет по нажатию на кнопку
//    private func addLikeButton () {
//        let button = UIButton(frame: .init(x: 150, y: 350, width: 100, height: 100))
//        button.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
//        let image = UIImage(systemName: "heart.fill")
//        if likeIsToched {
//            button.tintColor = .red
//        } else {
//            button.tintColor = .gray
//        }
//            button.setImage(image, for: .normal)
//        view.addSubview(button)
//    }
//
//    @objc private func didTapLikeButton() {
//        likeIsToched.toggle()
//    }


}
