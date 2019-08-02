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
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPasswordDidTapped(_ sender: Any) {
        self.validateFields()
        Api.User.resetPassword(email: self.emailTextField.text!, onSuccess: {
            self.view.endEditing(true)
            ProgressHUD.showSuccess(SUCCESS_EMAIL_RESET)
            self.navigationController?.popViewController(animated: true)
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
}
