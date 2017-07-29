//
//  LoginViewController.swift
//  QuickRoster
//
//  Created by Adam Wareing on 13/03/17.
//  Copyright © 2017 Simmonds Development. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        var username = self.usernameTextField.text
        var password = self.passwordTextField.text
        
        // Validate the text fields
        if (username?.characters.count)! < 5 {
            
            let alert = UIAlertController(title: "Invalid", message: "Username must be greater than 5 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true)
            
            
        } else if (password?.characters.count)! < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Password must be greater than 8 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true)
            
        } else {
            
            PFUser.logInWithUsername(inBackground: username!, password: password!, block: { (user, error) -> Void in
                
                if ((user) != nil) {
                    self.performSegue(withIdentifier: "login_from_home", sender: self)
                    
                } else {
                    let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true)
                }
            })
        }
        
    }
    
}
