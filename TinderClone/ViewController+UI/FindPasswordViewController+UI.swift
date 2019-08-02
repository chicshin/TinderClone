//
//  FindPasswordViewController+UI.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit
extension FindPasswordViewController {
    func styleCloseButton() {
        closeButton.setImage(UIImage(named: "close"), for: UIControl.State.normal)
        closeButton.imageView?.contentMode = .scaleAspectFit
        closeButton.tintColor = .black
    }
    
    func styleEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        emailContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.clipsToBounds = true
        
        let placeholderAttr = NSAttributedString(string: "Email address", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.borderStyle = .none
        emailTextField.textColor = .black
    }
    
    func styleSubmitButton(){
        submitButton.setTitle("Reset My Password", for: UIControl.State.normal)
        submitButton.backgroundColor = #colorLiteral(red: 0.9849042296, green: 0.7021037936, blue: 0, alpha: 0.6381635274)
        submitButton.layer.cornerRadius = 5
        submitButton.clipsToBounds = true
        submitButton.setTitleColor(.white, for: UIControl.State.normal)
        submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
}
