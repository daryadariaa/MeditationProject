//
//  MoodSliderVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 5/20/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import SSCircularSlider


var timeArray: [String] = []

class MoodSliderVC: UIViewController {
    
    @IBOutlet weak var sliderView: SSCircularRingSlider!
    @IBOutlet weak var moodView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    
    
    let arrValues: [Int] = [Int](0...10)
    var indexOfValue = 0
    var textOutput = ""
    var arr: [Int] = [Int]()
    var array: [Double] = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodView.setGradientBackground(colorOne: UIColor(rgb: 0x10C38D), colorTwo: UIColor(rgb: 0x11AAC3))
        sliderView.setArrayValues(labelValues: arrValues, currentIndex: indexOfValue)
        sliderView.delegate = self
        sliderView.setProgressLayerColor(colors: [UIColor(rgb: 0x3DE267).cgColor, UIColor(rgb: 0x27966A).cgColor])
        label.textColor = UIColor.black
        moodLabel.textColor = UIColor.black
        moodLabel.textAlignment = .center
        sliderView.setEndPointsImage(startPointImage: UIImage(named: "sad")!, endPointImage: UIImage(named: "happy1")!)
    }
    
    //MARK:- Actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        let moodValue = arr[arr.endIndex - 1]
        let timestamp = Date().timeIntervalSince1970
        let time = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM HH:mm"
        let date = formatter.string(from: time)
        timeArray.append(date.description)
        array.append(Double(moodValue))
        
        
        
        let defaults = UserDefaults.standard
        defaults.set(timeArray, forKey: "ArrayOfDates")
        
        defaults.set(array, forKey: "ArrayOfMoodValues")
        
        let array = UserDefaults.standard.array(forKey: "ArrayOfDates") ?? [String]()
        let array_ = UserDefaults.standard.array(forKey: "ArrayOfMoodValues") ?? [Double]()
        print(array_)
        print(array)
        print(moodValue)
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

