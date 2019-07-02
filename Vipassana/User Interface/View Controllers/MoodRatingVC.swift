//
//  MoodRatingVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 4/12/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit

class MoodRatingVC: UIViewController {
    
    @IBOutlet weak var moodView: UIView!
    @IBOutlet weak var moodTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodView.setGradientBackground(colorOne: UIColor(rgb: 0x10C38D), colorTwo: UIColor(rgb: 0x11AAC3))
        moodTableView.dataSource = self
        //moodTableView.delegate = self
    }
}

extension MoodRatingVC: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.allowsSelection = false
        tableView.rowHeight = moodView.frame.size.height / 2.5
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = UITableViewCell()
        
        cell.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "How\nSimply rate how are you feeling from one to ten, one being not good, and ten being really good. You can then see the results from today and previous days on your profile and compare it to things like your stress level, physical activity, and how much you’re using the app."
            cell.textLabel?.numberOfLines = 12
            cell.textLabel?.font = UIFont(name: "System", size: 0.5)
            cell.textLabel?.textColor = UIColor.black
        }
        if indexPath.row == 1 {
            cell.imageView?.image = UIImage(named: "breath")
            cell.imageView?.contentMode = .scaleAspectFill
        }
        if indexPath.row == 2 {
            cell.textLabel?.text = "Why\nKeeping an eye on our mood regularly can be very beneficial. Not only does it reminds ourselves 'how am I?' it allows us to look at patterns in our mood over time. You can realise that something specific triggers a few days of feeling bad, or on certain does you feel good."
            cell.textLabel?.numberOfLines = 12
            cell.textLabel?.font = UIFont(name: "System", size: 0.5)
            cell.textLabel?.textColor = UIColor.black
        }
        
        return cell
    }
}
