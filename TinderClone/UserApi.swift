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
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            if let authData = result {
                let dict : Dictionary<String,Any> = [
                    UID : authData.user.uid,
                    EMAIL: email,
                    USERNAME : username,
                    PROFILE_IMAGE_URL : "",
                ]
                
                guard let imageSelected = image else{
                    ProgressHUD.showError(ERROR_EMPTY_PHOTO)
                    return
                }
                
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                
                StorageService.savePhoto(username: username, uid: authData.user.uid, data: imageData, metadata: metadata, storageProfile: storageProfile, dict: dict, onSuccess: {
                    onSuccess()
                }, onError: { (errorMessage) in
                    onError(errorMessage)
                })
            }
        }
    }
}
