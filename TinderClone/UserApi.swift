//
//  UserApi.swift
//  TinderClone
//
//  Created by Jane Shin on 8/2/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

class UserApi {
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password , completion: { (result, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            if let authData = result {
                var dict : Dictionary<String,Any> = [
                    "uid" : authData.user.uid,
                    "email" : email,
                    "username" : username,
                    "profileImageUrl" : "",
                ]
                
                guard let imageSelected = image else{
                    ProgressHUD.showError("Please choose your profile image")
                    return
                }
                
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                let storageRef = Storage.storage().reference().child("profile").child(authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                
                storageRef.putData(imageData, metadata: metadata, completion: { (storageMetaData, error) in
                    if error != nil {
                        ProgressHUD.showError(error!.localizedDescription)
                        return
                    }
                    
                    storageRef.downloadURL(completion: { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl
                            
                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict, withCompletionBlock: { (error, ref) in
                                if error == nil {
                                    onSuccess()
                                } else {
                                    onError(error!.localizedDescription)
                                }
                                
                            })
                        }
                    })
                })
                
            }
        })
    }
}
