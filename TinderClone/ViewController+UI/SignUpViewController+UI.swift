//
//  SignUpViewController+UI.swift
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

extension SignUpViewController {
    func styleTitle() {
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.init(name: "Copperplate", size: 25)!,
             NSAttributedString.Key.foregroundColor : UIColor.black
            ])
        
        signUpLabel.attributedText = attributedText
    }
    
    // 1) show present photo library
    func styleProfileImage() {
        profileimage.layer.cornerRadius = profileimage.frame.width/2
        profileimage.clipsToBounds = true
        
        profileimage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        profileimage.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        //let the signup view present the image picker controller
        self.present(picker, animated: true, completion: nil)
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
    
    func signUp() {
        
        Api.User.signUp(withUsername: self.fullNameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: self.image, onSuccess: {
            print("Done")
        }) { (errorMessage) in
            print(errorMessage)
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// 2) now present the image picked from photo library in image view
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[.originalImage] as? UIImage {
            image = imageSelected
            profileimage.image = imageSelected
        }
        
        if let imageEdited = info[.editedImage] as? UIImage {
            image = imageEdited
            profileimage.image = imageEdited
        }
        
        dismiss(animated: true, completion: nil)
    }
}
