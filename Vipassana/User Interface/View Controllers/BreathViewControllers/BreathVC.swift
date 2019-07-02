//
//  BreathVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 5/22/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import Macaw

class BreathVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        showBreathViewController()
    }

    fileprivate func showBreathViewController() {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let breathViewController = mainStoryboard.instantiateViewController(withIdentifier: "\(BreathPracticeVC.self)") as? BreathPracticeVC else { return }
        
        navigationController?.pushViewController(breathViewController, animated: true)
    }
}
