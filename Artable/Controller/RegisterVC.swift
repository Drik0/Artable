//
//  RegisterVC.swift
//  Artable
//
//  Created by Gerson Costa on 18/05/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var pwConfirmationTxt: UITextField!
    @IBOutlet weak var passwordCheckImg: UIImageView!
    @IBOutlet weak var pwConfirmationCheckImg: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        pwConfirmationTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let passTxt = passwordTxt.text else { return }
        
        if textField == pwConfirmationTxt {
            passwordCheckImg.isHidden = false
            pwConfirmationCheckImg.isHidden = false
        } else {
            if passTxt.isEmpty {
                passwordCheckImg.isHidden = true
                pwConfirmationCheckImg.isHidden = true
                pwConfirmationTxt.text = ""
            }
        }
        
        if passwordTxt.text == pwConfirmationTxt.text {
            passwordCheckImg.image = UIImage(named: AppImages.greenCheck)
            pwConfirmationCheckImg.image = UIImage(named: AppImages.greenCheck)
        } else {
            passwordCheckImg.image = UIImage(named: AppImages.redCheck)
            pwConfirmationCheckImg.image = UIImage(named: AppImages.redCheck)
        }
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        
        guard let email = emailTxt.text, email.isNotEmpty,
            let username = usernameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                print("Success creating user")
                self.activityIndicator.stopAnimating()
                //self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
