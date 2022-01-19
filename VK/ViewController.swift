//
//  ViewController.swift
//  VK
//
//  Created by Beelab on 03/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let userLogin = "User"
    private let userPassword = "123456"
    
    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didLoginButtonPressed() {
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        checkForValidationData()
    }
    
    private  func checkForValidationData() -> Bool {
        if userLogin == login.text && userPassword == password.text {
            return true
        } else {
            showAlert(title: "Incorrect Login or Password 🥲", message: "Please try again with login: User \nand password: 123456 ")
        }
        return false
    }
    
}

// MARK: - showAlert
extension ViewController {
    private func showAlert (title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}



