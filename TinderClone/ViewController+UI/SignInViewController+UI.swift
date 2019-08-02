//
//  SignInViewController+UI.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit
import ProgressHUD

extension SignInViewController {
    func styleTitleLabel() {
        let title = "Tinder"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.init(name: "Copperplate", size: 35)!,
             NSAttributedString.Key.foregroundColor : UIColor.black])
        
        titleLabel.attributedText = attributedText
    }
    func styleEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        emailContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.clipsToBounds = true
    
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        emailTextField.borderStyle = .none
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = .black
    }
    func stylePasswordTextField() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        passwordContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        passwordContainerView.layer.cornerRadius = 3
        passwordContainerView.clipsToBounds = true
        
        let placeholderAttr = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        passwordTextField.borderStyle = .none
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = .black
    }
    func styleSignInButton() {
        signInButton.setTitle("Sign In", for: UIControl.State.normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signInButton.backgroundColor = #colorLiteral(red: 0.9849042296, green: 0.7021037936, blue: 0, alpha: 0.6381635274)
        signInButton.setTitleColor(.white, for: UIControl.State.normal)
        signInButton.layer.cornerRadius = 5
        signInButton.clipsToBounds = true
    }
    func styleSignUpButton() {
        let title = "Don't have an account? "
        let subTitle = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.5)])
        
        let attributedSubText = NSMutableAttributedString(string: subTitle, attributes:
            [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor(red: 0, green: 0, blue: 250, alpha: 0.8)
            ])
        attributedText.append(attributedSubText)
        signUpButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    
    func styleFindPasswordButton() {
        let title = "Forgot password?"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor(red: 0, green: 0, blue: 250, alpha: 0.8)])
        
        findPasswordButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    
    func validateFields() {
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL)
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
            return
        }
    }
    
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show()
        Api.User.signIn(email: self.emailTextField.text!, password: self.passwordTextField.text!, onSuccess: {
            ProgressHUD.dismiss()
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
