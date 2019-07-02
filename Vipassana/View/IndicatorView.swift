//
//  IndicatorView.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 5/16/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import Lottie

class InStatIndicatorView: UIView {
    let animationView = AnimationView(name: "InStatIndicator")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupIndicator()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupIndicator() {
        
        //animationView.loopMode = true
        animationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animationView)
        
        animationView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundColor = UIColor(white: 1, alpha: 0.4)
    }
}

extension InStatIndicatorView {
    
    func startAnimation() {
        DispatchQueue.main.async {
            self.animationView.play()
            self.isHidden = false
        }
    }
    
    func stopAnimation() {
        DispatchQueue.main.async {
            self.isHidden = true
            self.animationView.stop()
        }
    }
}
