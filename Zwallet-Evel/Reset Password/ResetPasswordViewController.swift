//
//  ResetPasswordViewController.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 19/08/23.
//

import UIKit

class ResetPasswordController: UIViewController {
    
    
    @IBOutlet weak var passwordCreate: UIImageView!
    @IBOutlet weak var passwordTextCreate: UITextField!
    @IBOutlet weak var passwordSeparatorCreate: UIView!
    
    @IBOutlet weak var passwordConfirm: UIImageView!
    @IBOutlet weak var passwordTextConfirm: UITextField!
    @IBOutlet weak var passwordSeparatorConfirm: UIView!
    @IBOutlet weak var resetPasswordButton: CustomButton!
    
    @IBOutlet weak var passwordPopUpPage: CustomPopUpPage!
    
    @IBOutlet weak var showPasswordButtonCreate: UIButton!
    
    @IBOutlet weak var showPasswordButtonConfirm: UIButton!
    
    
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        passwordTextCreate.delegate = self
        passwordTextConfirm.delegate = self
    }

    
    
    
    @IBAction func switchShowPasswordCreate(_ sender: Any) {
        let isSecureTextEntry = !passwordTextCreate.isSecureTextEntry
        passwordTextCreate.isSecureTextEntry = isSecureTextEntry
        if#available(iOS 13.0, *) {
            showPasswordButtonCreate.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash"): UIImage(systemName: "eye)"), for: .normal)
        } else {
            
        }
    }

    @IBAction func switchShowPasswordConfirm(_ sender: Any) {
        let isSecureTextEntry = !passwordTextConfirm.isSecureTextEntry
        passwordTextConfirm.isSecureTextEntry = isSecureTextEntry
        if#available(iOS 13.0, *) {
            showPasswordButtonConfirm.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash"): UIImage(systemName: "eye)"), for: .normal)
        } else {
            
        }
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        let email: String = email
        let password: String = passwordTextCreate.text ?? ""
        AuthNetwork().forgotPassword(email: email, password: password) { data, error in
            if data != nil {
                self.showLogin()
            } else {
                print("Gagal")
            }
        }
    }
    
}

extension ResetPasswordController: UITextFieldDelegate {
     func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
    
        case passwordTextCreate:
            passwordCreate.tintColor = UIColor(named: "Primary")
            passwordSeparatorCreate.backgroundColor = UIColor(named: "Primary")
            
        case passwordTextConfirm:
            passwordConfirm.tintColor = UIColor(named: "Primary")
            passwordSeparatorConfirm.backgroundColor = UIColor(named: "Primary")
            resetPasswordButton.tintColor = .white
            resetPasswordButton.backgroundColor = UIColor(named: "Primary")
            
        default:
            break
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
            
        case passwordTextCreate:
            if !(passwordTextCreate.text ?? "").isEmpty {
                passwordCreate.tintColor = UIColor(named: "Primary")
                passwordSeparatorCreate.tintColor = UIColor(named: "Primary")
            } else {
                passwordCreate.tintColor = UIColor(named: "Font2")
                passwordSeparatorCreate.tintColor = UIColor(named: "Font2")
            }
            
        case passwordTextConfirm:
            if !(passwordTextConfirm.text ?? "").isEmpty {
                passwordConfirm.tintColor = UIColor(named: "Primary")
                passwordSeparatorConfirm.tintColor = UIColor(named: "Primary")
                resetPasswordButton.tintColor = .white
                resetPasswordButton.backgroundColor = UIColor(named: "Primary")
            } else {
                passwordConfirm.tintColor = UIColor(named: "Font2")
                passwordSeparatorConfirm.tintColor = UIColor(named: "Font2")
                resetPasswordButton.tintColor = .white
                resetPasswordButton.backgroundColor = UIColor(named: "Font2")
            }
        default :
            break
        }
    }
}

extension ResetPasswordController {
    func showLogin() {
        let alert = UIAlertController(
            title: "Success",
            message: "Password telah diperbaharui \nSilahkan Login", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .cancel, handler: { action in
            self.showLoginViewController()
        }))
        present(alert, animated: true)
        
            //showLoginViewController()
    }
}
//extension ResetPasswordController {
//    func showLoginViewController() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "Login")
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//}


