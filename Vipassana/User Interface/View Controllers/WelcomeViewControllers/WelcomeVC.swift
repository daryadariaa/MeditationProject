//
//  WelcomeVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 6/25/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//


import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet var registerButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerButton.layer.cornerRadius = registerButton.frame.height / 4
        logInButton.layer.cornerRadius = logInButton.frame.height / 4
        
        self.view.sendSubview(toBack: imageView)
    }

    override func didReceiveMemoryWarning() {
        
    }

}
