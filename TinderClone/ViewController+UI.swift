//
//  ViewController+UI.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit

extension ViewController {
    func styleHeaderTitle() {
        let title = "Create a new account"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.init(name: "Copperplate", size: 25)!,
             NSAttributedString.Key.foregroundColor : UIColor.darkGray,
            ])
        
        titleLabel.textAlignment = .center
        titleLabel.attributedText = attributedText
    }
    
    func styleOrLabel() {
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 13)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
    }
    
    func styleTermsLabel() {
        let termsOfServiceTitle = "By clicking \"Create a new account\", you agree to our "
        let subTermsOfService = "Terms of Service"
        
        
        let attributedTermsText = NSMutableAttributedString(string: termsOfServiceTitle, attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10),
             NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)
            ])
        
        let attributedSubTerms = NSMutableAttributedString(string: subTermsOfService, attributes:
            [NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65),
             NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10)
            ])
        
        attributedTermsText.append(attributedSubTerms)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        attributedTermsText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedTermsText.length))
        
        termsOfServiceLabel.attributedText = attributedTermsText
//        termsOfServiceLabel.numberOfLines = 0
    }
    
    func styleFacebookButton() {
        signInFacebookButton.setTitle("Sign in with Facebook", for: UIControl.State.normal)
        signInFacebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInFacebookButton.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signInFacebookButton.layer.cornerRadius = 5
        signInFacebookButton.clipsToBounds = true
        signInFacebookButton.setTitleColor(.white, for: UIControl.State.normal)
        
        signInFacebookButton.setImage(UIImage(named: "facebook"), for: UIControl.State.normal)
        signInFacebookButton.imageView?.contentMode = .scaleAspectFit
        signInFacebookButton.tintColor = .white
        signInFacebookButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -15, bottom: 12, right: 20)
    }
    
    func styleGoogleButton() {
        signInGoogleButton.setTitle("Sign in with Google", for: UIControl.State.normal)
        signInGoogleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInGoogleButton.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        signInGoogleButton.layer.cornerRadius = 5
        signInGoogleButton.clipsToBounds = true
        signInGoogleButton.setTitleColor(.white, for: UIControl.State.normal)
        
        signInGoogleButton.setImage(UIImage(named: "google"), for: UIControl.State.normal)
        signInGoogleButton.imageView?.contentMode = .scaleAspectFit
        signInGoogleButton.tintColor = .white
        signInGoogleButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -35, bottom: 12, right: 20)
    }
    
    func styleCreateAccountButton() {
        createAccountButton.setTitle("Create a new account", for: UIControl.State.normal)
        createAccountButton.setTitleColor(.white, for: UIControl.State.normal)
        createAccountButton.backgroundColor = #colorLiteral(red: 0.9849042296, green: 0.7021037936, blue: 0, alpha: 0.6381635274)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        createAccountButton.setTitleShadowColor(.white, for: UIControl.State.normal)
        createAccountButton.layer.cornerRadius = 5
        createAccountButton.clipsToBounds = true
    }

}
