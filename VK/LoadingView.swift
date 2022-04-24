//
//  LoadingView.swift
//  VK
//
//  Created by Beelab on 06/02/22.
//

import UIKit

@IBDesignable class LoadingView: UIView {
    
    private let circle1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let circle2: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 20, height: 20))
    private let circle3: UIView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
    
    override func draw(_ rect: CGRect) {
        setupLoadingView()
    }
    
    
    func setupLoadingView(){
        circle1.backgroundColor = .red
        circle1.layer.cornerRadius = self.circle1.frame.width / 2
        circle2.backgroundColor = .red
        circle2.layer.cornerRadius = self.circle2.frame.width / 2
        circle3.backgroundColor = .red
        circle3.layer.cornerRadius = self.circle3.frame.width / 2
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.repeat, .autoreverse], animations: {self.circle1.alpha = 0})
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat, .autoreverse], animations: {self.circle2.alpha = 0})
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse], animations: {self.circle3.alpha = 0})
        
        self.addSubview(circle1)
        self.addSubview(circle2)
        self.addSubview(circle3)
    }
}
