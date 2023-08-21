//
//  RegisterViewController.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 14/08/23.
//

import UIKit
import SwiftUI

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameIconImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameSeparator: UIView!
    
    @IBOutlet weak var emailIconImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailSeparator: UIView!
    
    @IBOutlet weak var passwordIconImage: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordSeparator: UIView!
    
    @IBOutlet weak var popUpPage: CustomPopUpPage!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let textGrey = "Already have an account? Let’s"
        let textLogin = "Login"
        
        let loginText = NSMutableAttributedString(string: "\(textGrey) \(textLogin)", attributes:  [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.black]
        )
        loginText.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .foregroundColor: UIColor(named: "Font2")!
            ],
            range: NSString(string: loginText.string).range(of: textGrey)
        )
        loginText.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                .foregroundColor: UIColor(named: "Primary")!
            ],
            range: NSString(string: loginText.string).range(of: textLogin)
        )
        loginTextButton.setAttributedTitle(loginText, for: .normal)
    }
    
    @IBAction func tooglePasswordSecure(_ sender: Any) {
            let isSecureTextEntry = !passwordTextField.isSecureTextEntry
            passwordTextField.isSecureTextEntry = isSecureTextEntry
            if#available(iOS 13.0, *) {
                showPasswordButton.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye"), for: .normal)
            } else {
                
            }
        }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let username: String = usernameTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        AuthNetwork().register(username: username, email: email, password: password) {
            dataRegister, error in
            if dataRegister != nil {
                self.showOTPViewController()
            } else {
                print ("username, email, or password are unavailable")
            }
        }
        
    }
    
    @IBAction func loginTextTapped(_ sender: Any) {
        showLoginViewController()
    }
    
    
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case usernameTextField:
            usernameIconImageView.tintColor = UIColor(named: "Primary")
            usernameSeparator.backgroundColor = UIColor(named: "Primary")
            
        case emailTextField:
            emailIconImageView.tintColor = UIColor(named: "Primary")
            emailSeparator.backgroundColor = UIColor(named: "Primary")
            
        case passwordTextField:
            passwordIconImage.tintColor = UIColor(named: "Primary")
            passwordSeparator.backgroundColor = UIColor(named: "Primary")
            signUpButton.tintColor = .white
            signUpButton.backgroundColor = UIColor(named: "Primary")
            
        default:
            break
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason:
                                UITextField.DidEndEditingReason) {
        switch textField {
        case usernameTextField:
            if !(usernameTextField.text ?? "").isEmpty {
                usernameIconImageView.tintColor = UIColor(named: "Primary")
                usernameSeparator.backgroundColor = UIColor(named: "Primary")
            } else {
                usernameIconImageView.tintColor = UIColor(named: "Font2")
                usernameSeparator.backgroundColor = UIColor(named: "Font2")
            }
            
        case emailTextField:
            if !(emailTextField.text ?? "").isEmpty {
                emailIconImageView.tintColor = UIColor(named: "Primary")
                emailSeparator.backgroundColor = UIColor(named: "Primary")
            } else {
                emailIconImageView.tintColor = UIColor(named: "Font2")
                emailSeparator.backgroundColor = UIColor(named: "Font2")
            }
            
        case passwordTextField:
            if !(passwordTextField.text ?? "").isEmpty {
                passwordIconImage.tintColor = UIColor(named: "Primary")
                passwordSeparator.backgroundColor = UIColor(named: "Primary")
                signUpButton.tintColor = .white
                signUpButton.backgroundColor = UIColor(named: "Primary")
                
            } else {
                passwordIconImage.tintColor = UIColor(named: "Font2")
                passwordSeparator.backgroundColor = UIColor(named: "Font2")
                signUpButton.tintColor = .white
                signUpButton.backgroundColor = UIColor(named: "DisabledButton")
                
            }
        default:
            break
        }
    }
}

extension UIViewController {
    func showRegisterViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Register")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UIViewController {
    func showOTPViewController() {
        let storyboard = UIStoryboard(name: "PinOTP", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "OTP")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
