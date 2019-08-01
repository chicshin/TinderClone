//
//  SignInViewController.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var findPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleUI()
    }
    
    func styleUI() {
        styleTitleLabel()
        styleEmailTextField()
        stylePasswordTextField()
        styleSignInButton()
        styleSignUpButton()
        styleFindPasswordButton()
    }
    

}
