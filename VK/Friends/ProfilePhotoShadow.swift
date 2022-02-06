//
//  FriendsPhotoShadow.swift
//  VK
//
//  Created by Beelab on 30/01/22.
//

import UIKit

@IBDesignable  class ProfilePhotoShadow: UIView {

    @IBInspectable var shadowRadius: CGFloat = 5 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.5
    {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 5, height: 5) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 120 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
//        self.backgroundColor = .black
//        //self.layer.cornerRadius = cornerRadius
//        //self.layer.masksToBounds = true
//        
//        self.layer.shadowColor = shadowColor.cgColor
//        self.layer.shadowRadius = shadowRadius
//        self.layer.shadowOffset = shadowOffset
//        self.layer.shadowOpacity = shadowOpacity
//        
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        testView.layer.borderWidth = 1
        //testView.layer.borderColor = UIColor.red.cgColor
        testView.layer.cornerRadius = testView.frame.height / 2
        testView.layer.shadowColor = shadowColor.cgColor
        testView.layer.shadowOpacity = shadowOpacity
        testView.layer.shadowRadius = shadowRadius
        testView.layer.shadowOffset = shadowOffset


        self.addSubview(testView)
        
    }
    

}
