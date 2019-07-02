//
//  WorkoutTypesTVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 5/21/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit

class WorkoutTypesTVC: UITableViewController {
    
    
    @IBOutlet weak var workoutTypesTableView: UITableView!
    @IBOutlet weak var meditationTableViewCell: UITableViewCell!
    @IBOutlet weak var deepBreathingTableViewCell: UITableViewCell!
    @IBOutlet weak var yogaTableViewCell: UITableViewCell!
    @IBOutlet weak var moodRatingTableViewCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // MARK: - Table view appearence
        
        self.workoutTypesTableView.rowHeight = self.workoutTypesTableView.frame.height / 6
        let backgroundImageView = UIImageView(image: UIImage(named: "tableViewBack"))
        backgroundImageView.frame = self.workoutTypesTableView.frame
        self.workoutTypesTableView.backgroundView = backgroundImageView
        backgroundImageView.contentMode = .scaleAspectFill
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
            let cell:UITableViewCell! = UITableViewCell()
            
            cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
            
            if indexPath.row == 0 {
                cell.textLabel?.text = "Meditation"
                cell.textLabel?.font = UIFont.init(name: "CoffeeService", size: 34)
                cell.textLabel?.textAlignment = NSTextAlignment.center
            }
            if indexPath.row == 1 {
                cell.textLabel?.text = "Deep breathing"
                cell.textLabel?.font = UIFont.init(name: "CoffeeService", size: 34)
                cell.textLabel?.textAlignment = NSTextAlignment.center
            }
            if indexPath.row == 2 {
                cell.textLabel?.text = "Rate your mood"
                cell.textLabel?.font = UIFont.init(name: "CoffeeService", size: 34)
                cell.textLabel?.textAlignment = NSTextAlignment.center
            }
            
            if indexPath.row == 3 {
                cell.isSelected = false
            }
            
            if indexPath.row == 4 {
                cell.isSelected = false
            }
            
            return cell
            
    }
    
    // MARK: - Transition to selected workout view controller
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: showMeditationViewController()
        case 1: showDeepBreathingViewController()
        case 2: showMoodRatingViewController()
        default: break
        }
    }
    
    private func showMeditationViewController() {
        let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
            withIdentifier: "\(ViewController.self)") as! ViewController
        self.present(mainstoryBoard, animated: true) { }
    }
    
    private func showDeepBreathingViewController() {
        let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let breathingViewController = mainstoryBoard.instantiateViewController(
            withIdentifier: "\(BreathVC.self)") as? BreathVC else { return }
        navigationController?.pushViewController(breathingViewController, animated: true)
    }
    
    private func showMoodRatingViewController() {
        let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let moodViewController = mainstoryBoard.instantiateViewController(
            withIdentifier: "\(MoodRatingVC.self)") as? MoodRatingVC else { return }
        navigationController?.pushViewController(moodViewController, animated: true)
    }
}
