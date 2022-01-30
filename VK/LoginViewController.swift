//
//  ViewController.swift
//  VK
//
//  Created by Beelab on 03/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var currentUser: User!
    
    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didLoginButtonPressed() {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if checkForValidationData() {
            guard let tabBarController = segue.destination as? UITabBarController else {return}
            guard let tabBarControllers = tabBarController.viewControllers else {return}
            
            for viewController in tabBarControllers {
                guard let destinationNavigationController = viewController as? UINavigationController else {return}
                let destVC = destinationNavigationController.topViewController
                switch destVC {
                case is FriendsTableViewController:
                    let destController = destVC as! FriendsTableViewController
                    destController.currentUser = currentUser
                case is UserGroupTableViewController:
                    let destController = destVC as! UserGroupTableViewController
                    destController.currentUser = currentUser
                default:
                    break
                }
                
            }
        }
    }
    
    private  func checkForValidationData() -> Bool {
        
        if let currentUser = findUser(login: login.text ?? "", password: password.text ?? "") {
            self.currentUser = currentUser
            return true
        }
        showAlert(title: "Incorrect Login or Password 🥲", message: "Please try again with login: User \nand password: 123456 ")
        return false
    }
    
}

// MARK: - showAlert
extension LoginViewController {
    private func showAlert (title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - findUser
extension LoginViewController {
    private func findUser(login: String, password: String) -> User? {
        let userList = DataManager.shared.createTempUsers()
        for user in userList {
            if user.login == login && user.password == password {
                return user
            }
        }
        return nil
    }
}



