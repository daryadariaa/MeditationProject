//
//  BreathVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 4/8/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit

class BreathVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        showBreathViewController()
    }
    
    fileprivate func showBreathViewController() {
        let mainstoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let breathViewController = mainstoryboard.instantiateViewController(withIdentifier: "\(BreathPracticeVC.self)") as? BreathPracticeVC else { return }
        navigationController?.pushViewController(breathViewController, animated: true)
    }
}
