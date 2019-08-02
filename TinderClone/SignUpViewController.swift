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
            print("username is required")
            return
        }
        guard let email = self.emailTextField.text, !email.isEmpty else {
            print("username is required")
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            print("username is required")
            return
        }
    }
    
    @IBAction func closeButton_touchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        
        self.view.endEditing(true)
        self.validateFields()
        
        guard let imageSelected = self.image else{
            print("Profile image is empty")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
        let uid = Auth.auth().currentUser?.uid
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (result, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = result {
                var dict : Dictionary<String,Any> = [
                "uid" : uid!,
                "email" : self.emailTextField.text!,
                "profileImageUrl" : "",
                "status" : ""
                ]
                
                let storageRef = Storage.storage().reference().child("profile").child(uid!)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                
                storageRef.putData(imageData, metadata: metadata, completion: { (storageMetaData, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    storageRef.downloadURL(completion: { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl
                            
                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict, withCompletionBlock: { (error, ref) in
                                if error == nil {
                                    print("Done")
                                }
                            })
                        }
                    })
                })

            }
        })
    }
    
    
}
