//
//  SignUpViewController.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit

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
}
