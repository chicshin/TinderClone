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
    
    @IBAction func closeButton_touchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (result, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = result {
                print(authData.user)
            }
            
//            let uid = Auth.auth().currentUser?.uid
//            Database.database().reference().child("users").child(uid!).setValue(
//                ["name" : self.fullNameTextField.text!,
//                "uid" : uid!,
//                "email" : self.emailTextField.text!
//            ])
        })
    }
}
