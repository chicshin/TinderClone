//
//  ViewController.swift
//  TinderClone
//
//  Created by Jane Shin on 7/30/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    @IBOutlet weak var signInFacebookButton: UIButton!
    @IBOutlet weak var signInGoogleButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleUI()
    }

    func styleUI() {
        styleHeaderTitle()
        styleOrLabel()
        styleFacebookButton()
        styleGoogleButton()
        styleTermsLabel()
        styleCreateAccountButton()
    }

}

