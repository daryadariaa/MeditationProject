//
//  MoodSliderVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 5/20/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import SSCircularSlider
import RealmSwift
import ChameleonFramework

class MoodSliderVC: UIViewController {
    
    @IBOutlet weak var sliderView: SSCircularRingSlider!
    @IBOutlet weak var moodView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    
    let realm = try! Realm()
    
    let arrValues: [Int] = [Int](0...10)
    var indexOfValue = 0
    var textOutput = ""
    var arrayOfValues = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        moodView.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: moodView.frame, andColors: [(UIColor.flatMint()?.lighten(byPercentage: 100))!, (UIColor.flatMint()?.darken(byPercentage: 100))!])
        
        sliderView.delegate = self
        
        sliderView.setArrayValues(labelValues: arrValues, currentIndex: indexOfValue)
        sliderView.setProgressLayerColor(colors: [UIColor(rgb: 0x3DE267).cgColor, UIColor(rgb: 0x27966A).cgColor])
        label.textColor = UIColor.black
        moodLabel.textColor = UIColor.black
        moodLabel.textAlignment = .center
        sliderView.setEndPointsImage(startPointImage: UIImage(named: "sad")!, endPointImage: UIImage(named: "happy1")!)
    }
    
    //MARK:- Actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        let moodValue = arrayOfValues[arrayOfValues.endIndex - 1]
        
        let currentMood = Mood()
        
        currentMood.moodValue = moodValue
        
        currentMood.dateRated = Date()
        
        do {
            try realm.write {
                
                realm.add(currentMood)
            }
        }
        catch {
            print("Error saving mood value : \(error)")
        }
    }
    
}

//MARK:- Delegate methods

extension MoodSliderVC: SSCircularRingSliderDelegate {
    
    func controlValueUpdated(value: Int) {
        
        arrayOfValues.append(value)
        
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
        
        for _ in 0..<arrayOfValues.count {
            moodLabel.text = textOutput
        }
    }
}

