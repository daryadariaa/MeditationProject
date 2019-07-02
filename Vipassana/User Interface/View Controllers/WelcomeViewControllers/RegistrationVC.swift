//
//  RegistrationVC.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 6/25/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegistrationVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
        registerButton.layer.cornerRadius = registerButton.frame.height / 4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        //SVProgressHUD.show()
        
        view.endEditing(true)
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                let alert = UIAlertController(title: "Registration failed!", message: "Please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                    self.emailTextField.becomeFirstResponder() }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                //SVProgressHUD.dismiss()
                let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let workoutVC = mainstoryBoard.instantiateViewController(
                    withIdentifier: "\(HomeVC.self)") as? HomeVC else { return }
                self.navigationController?.pushViewController(workoutVC, animated: true)
            }
        }
    }
    
}
