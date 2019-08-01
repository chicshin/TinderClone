//
//  FindPasswordViewController.swift
//  TinderClone
//
//  Created by Jane Shin on 8/1/19.
//  Copyright © 2019 Jane Shin. All rights reserved.
//

import UIKit

class FindPasswordViewController: UIViewController {
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleUI()
    }

    func styleUI() {
        
        styleCloseButton()
        styleEmailTextField()
        styleSubmitButton()
    }

}
