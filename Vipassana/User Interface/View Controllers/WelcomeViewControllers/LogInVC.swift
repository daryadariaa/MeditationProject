//
//  LoginVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 6/25/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
        logInButton.layer.cornerRadius = logInButton.frame.height / 4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        view.endEditing(true)
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                let alert = UIAlertController(title: "Login failed!", message: "Please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                    self.emailTextField.becomeFirstResponder() }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let workoutVC = mainstoryBoard.instantiateViewController(
                    withIdentifier: "\(HomeVC.self)") as? HomeVC else { return }
                self.navigationController?.pushViewController(workoutVC, animated: true)
            }
        }
    }
    
    //MARK:- TextField Delegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
}
