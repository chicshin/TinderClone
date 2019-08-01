//
//  SignUpViewController+UI.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit

extension SignUpViewController {
    func styleTitle() {
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.init(name: "Copperplate", size: 25)!,
             NSAttributedString.Key.foregroundColor : UIColor.black
            ])
        
        signUpLabel.attributedText = attributedText
    }
    
    func styleProfileImage() {
        profileimage.layer.cornerRadius = profileimage.frame.width/2
        profileimage.clipsToBounds = true
    }
    
    func styleFullNameTextField() {
        fullNameContainerView.layer.borderWidth = 1
        fullNameContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        fullNameContainerView.layer.cornerRadius = 3
        fullNameContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        fullNameContainerView.clipsToBounds = true
        
        let placeholderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        fullNameTextField.attributedPlaceholder = placeholderAttr
        fullNameTextField.textColor = UIColor.black
        fullNameTextField.borderStyle = .none
    }
    func styleEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        emailContainerView.clipsToBounds = true
        
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor.black
        emailTextField.borderStyle = .none
    
    }
    func stylePasswordTextField() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        passwordContainerView.layer.cornerRadius = 3
        passwordContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        passwordContainerView.clipsToBounds = true
        
        let placeholderAttr = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor.black
        passwordTextField.borderStyle = .none
    
    }
    func styleSignUpButton() {
        signUpButton.setTitle("Sign Up", for: UIControl.State.normal)
        signUpButton.backgroundColor = #colorLiteral(red: 0.9849042296, green: 0.7021037936, blue: 0, alpha: 0.6381635274)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signUpButton.setTitleColor(.white, for: UIControl.State.normal)
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        
    }
    func styleSignInButton() {
        let title = "Already have an account? "
        let subtitle = "Sign In"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.5)
            ])
        
        let attributedSubText = NSMutableAttributedString(string: subtitle, attributes:
            [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 0, green: 0, blue: 250, alpha: 0.8)
            ])
        attributedText.append(attributedSubText)
        signInButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
}