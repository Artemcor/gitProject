//
//  ViewController.swift
//  project
//
//  Created by Стожок Артём on 09.08.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
        }
    }
    
    
    var radius = 7.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ajdkasjdkasj
        facebookButton.layer.cornerRadius = CGFloat(radius)
        googleButton.layer.cornerRadius = CGFloat(radius)
        loginButton.layer.cornerRadius = CGFloat(radius)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        if email != "", password != "" {
            if isValidEmail(email!) && isValidatePassword(password!) {
                let alert = UIAlertController(title: "Congratulation", message: "You have signed successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in }))
                present(alert, animated: true, completion: {})
            } else {
                let alert = UIAlertController(title: "Oh no!!!", message: "You should write right password and Email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in }))
                present(alert, animated: true, completion: {})

            }
        } else {
            let alert = UIAlertController(title: "Warning", message: "You should fill password and Email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in }))
            present(alert, animated: true, completion: {})

        }
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidatePassword(_ password: String) -> Bool {
        if password.count > 5 {
            return true
        }
        return false
    }
    


}

