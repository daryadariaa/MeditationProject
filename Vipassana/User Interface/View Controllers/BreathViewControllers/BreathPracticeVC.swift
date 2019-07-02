//
//  BreathPracticeVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 4/8/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit

class BreathPracticeVC: UIViewController {
    
    
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var breathView: UIView!
    
    let breatheViewPadding: CGFloat = 20
    
    let viewCornerRadius: CGFloat = 5
    let borderViewWidth: CGFloat = 10
    let borderViewColor = UIColor.blue.cgColor
    
    var fullBreathViewFrame: CGRect = CGRect()
    var emptyBreathViewFrame: CGRect = CGRect()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.register(defaults: [BreatheInTimeKey:3,
                                                  PauseTimeAfterBreathInKey:1,
                                                  BreatheOutTimeKey: 4,
                                                  PauseTimeAfterBreathOutKey: 1])
        
        borderView.backgroundColor = UIColor.white
        borderView.layer.borderColor = borderViewColor
        borderView.layer.borderWidth = borderViewWidth
        borderView.layer.cornerRadius = viewCornerRadius
        
        breathView.layer.cornerRadius = viewCornerRadius
        
        NotificationCenter.default.addObserver(self, selector: #selector(BreathPracticeVC.appDidBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BreathPracticeVC.appDidEnterBackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    
    @objc func appDidBecomeActive() {
        startBreathingAnimation()
    }
    
    @objc func appDidEnterBackground() {
        stopBreathingAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let breathViewWidth = borderView.frame.size.width - 2 * breatheViewPadding
        
        fullBreathViewFrame = CGRect(x: breatheViewPadding,
                                    y: breatheViewPadding,
                                    width: breathViewWidth,
                                    height: borderView.frame.size.height - 2 * breatheViewPadding)
        
        emptyBreathViewFrame = CGRect(x: borderView.frame.size.width / 2,
                                     y: borderView.frame.size.height / 2,
                                     width: 0,
                                     height: 0)
        
        startBreathingAnimation()
    }
    
    func startBreathingAnimation() {
        stopBreathingAnimation()    // Breath bar begins from the bottom
        breathView.isHidden = false
        expand(afterDelay: 0)                    // Initial expansion starts immediately
    }
    
    func stopBreathingAnimation() {
        breathView.layer.removeAllAnimations()
        breathView.frame = emptyBreathViewFrame
    }
    
    func collapse(afterDelay delay: TimeInterval) {
        UIView.animate(withDuration: userDefaultForTime(userDefaultsKey: BreatheOutTimeKey), delay: delay, options: .curveLinear, animations: {
            self.breathView.frame = self.emptyBreathViewFrame
            
        }, completion: { finished in
            if (finished) {
                self.expand(afterDelay: self.userDefaultForTime(userDefaultsKey: PauseTimeAfterBreathOutKey))
            } else {
                self.stopBreathingAnimation()
            }
        })
    }
    
    func expand(afterDelay delay: TimeInterval) {
        UIView.animate(withDuration: userDefaultForTime(userDefaultsKey: BreatheInTimeKey), delay: delay, options: .curveLinear, animations: {
            self.breathView.frame = self.fullBreathViewFrame
        }, completion: { finished in
            if (finished) {
                self.collapse(afterDelay: self.userDefaultForTime(userDefaultsKey: PauseTimeAfterBreathInKey))
            } else {
                self.stopBreathingAnimation()
            }
        })
    }
    
    func userDefaultForTime(userDefaultsKey: String) -> Double {
        return Double(UserDefaults.standard.integer(forKey: userDefaultsKey))
    }
}
