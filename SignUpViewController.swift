//
//  SignupViewController.swift
//  QuickRoster
//
//  Created by Adam Wareing on 18/03/17.
//  Copyright © 2017 Simmonds Development. All rights reserved.
//

import Foundation
import UIKit
import Parse

class SignupViewController: UIViewController {
    
    @IBOutlet weak var businessNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var managerName: UITextField!
    @IBOutlet weak var registerBusinessButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func registerBusinessButton(_ sender: Any) {
        let businessName = self.businessNameLabel.text
        let email = self.emailLabel.text
        let managerName = self.managerName.text
        
        // Validate the text fields
        if (businessName?.characters.count)! < 5 {
            
            let alert = UIAlertController(title: "Invalid", message: "Username must be greater than 5 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true)
            
            
        } else if (email?.characters.count)! < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Password must be greater than 8 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true)
            
        } else if (email?.characters.count)! < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Password must be greater than 8 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true)
            
        }
            
            
        else {
            let newUser = PFUser()
            
            newUser.username = managerName
            
            // Sign up the user asynchronously
            newUser.signUpInBackground(block: { (succeed, error) -> Void in
                
                if ((error) != nil) {
                    let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true)
                    
                } else {
                    let alert = UIAlertController(title: "Success", message: "Signed Up", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true)
                    
                    // TODO transition
                }
                
            })
        }
    }
}


extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}
