//
//  SignUpViewController.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var fullNameContainerView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var image : UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleUI()

    }
    
    func styleUI() {
        styleTitle()
        styleProfileImage()
        styleFullNameTextField()
        styleEmailTextField()
        stylePasswordTextField()
        styleSignUpButton()
        styleSignInButton()
    }
    
    func validateFields() {
        guard let username = self.fullNameTextField.text, !username.isEmpty else {
            ProgressHUD.showError("Please enter an username")
            return
        }
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter a password")
            return
        }
    }
    
    @IBAction func closeButton_touchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        
        self.view.endEditing(true)
        self.validateFields()
        self.signUp()
        
    }
    
    
}
