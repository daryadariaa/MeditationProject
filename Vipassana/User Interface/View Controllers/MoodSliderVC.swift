//
//  MoodSliderVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 4/15/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import SSCircularSlider

class MoodSliderVC: UIViewController {
    
    @IBOutlet weak var sliderView: SSCircularRingSlider!
    @IBOutlet weak var moodView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    
    let arrValues: [Int] = [Int](0...10)
    var indexOfValue = 0
    var arr: [Int] = [Int]()
    var textOutput = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodView.setGradientBackground(colorOne: UIColor(rgb: 0x10C38D), colorTwo: UIColor(rgb: 0x11AAC3))
        sliderView.setArrayValues(labelValues: arrValues, currentIndex: indexOfValue)
        sliderView.delegate = self
        sliderView.setProgressLayerColor(colors: [UIColor(rgb: 0x3DE267).cgColor, UIColor(rgb: 0x27966A).cgColor])
        label.textColor = UIColor.black
        moodLabel.textColor = UIColor.black
        moodLabel.textAlignment = .center
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        var dict: [String : Int] = [:]
        let moodValue = arr[arr.endIndex - 1]
        let timestamp = Date().timeIntervalSince1970
        let time = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM HH:mm"
        let date = formatter.string(from: time)
        dict = [date : moodValue]
        
        let defaults = UserDefaults.standard
        defaults.set(dict, forKey: "Mood values")
        
        for (key, value) in dict {
            print("Date: \(key), mood value: \(value)")
        }
    }
}


extension MoodSliderVC: SSCircularRingSliderDelegate {
    func controlValueUpdated(value: Int) {
        arr.append(value)
        
        switch value {
        case 0..<2 :
            textOutput = "Awful"
        case 3, 4:
            textOutput = "Not Good"
        case 5, 6:
            textOutput = "Okay"
        case 7, 8:
            textOutput = "Very Good"
        case 9, 10:
            textOutput = "Great"
        default:
            return
        }
        for _ in 0..<arr.count {
            moodLabel.text = textOutput
        }
    }
}
