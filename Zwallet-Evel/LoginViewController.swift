//
//  LoginViewController.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 13/08/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailIconImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailSeparator: UIView!
    
    
    @IBOutlet weak var passwordIconImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordSeparator: UIView!
    
    @IBOutlet weak var showPasswordButton: UIButton!
 
    @IBOutlet weak var popUpPage: CustomPopUpPage!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpTextButton: UIButton!
    
    @IBOutlet weak var passwordError: UIView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let textGrey = "Don't have an account? Let's"
        let textSignUp = "Sign Up"
        
        let signUpText = NSMutableAttributedString(string: "\(textGrey) \(textSignUp)", attributes: [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.black]
        )
        signUpText.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .foregroundColor: UIColor(named: "Font2")!
            ],
            range: NSString(string: signUpText.string).range(of: textGrey)
        )
        signUpText.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                .foregroundColor: UIColor(named: "Primary")!
            ],
            range: NSString(string: signUpText.string).range(of: textSignUp)
        )
        signUpTextButton.setAttributedTitle(signUpText, for: .normal)
        
    }
    @IBAction func tooglePasswordSecure(_ sender: Any) {
        let isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry = isSecureTextEntry
        if#available(iOS 13.0, *) {
            showPasswordButton.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash") :
                                            UIImage(systemName: "eye"), for: .normal)
        } else {
        }
    }
    
    @IBAction func SignUpTextTapped(_ sender: Any) {
        showRegisterViewController()
    }
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        AuthNetwork().login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { dataLogin, error in
            if let loginData = dataLogin {
                UserDefaults.standard.set(loginData.token, forKey: "AccessToken")
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let homeViewController = storyboard.instantiateViewController(withIdentifier: "Tabbar")
                
                let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
                window?.rootViewController = UINavigationController(rootViewController: homeViewController)
                
            } else {
                self.passwordError.isHidden = false
                self.emailIconImageView.tintColor = UIColor(named: "Error")
                self.emailSeparator.backgroundColor = UIColor(named: "Error")
                self.passwordIconImageView.tintColor = UIColor(named: "Error")
                self.passwordSeparator.backgroundColor = UIColor(named: "Error")
            }
        }
        showViewController()
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        showResetEmailController()
    }
    
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailIconImageView.tintColor = UIColor(named: "Primary")
            emailSeparator.backgroundColor = UIColor(named: "Primary")
            
        case passwordTextField:
            passwordIconImageView.tintColor = UIColor(named: "Primary")
            passwordSeparator.backgroundColor = UIColor(named: "Primary")
            loginButton.tintColor = .white
            loginButton.backgroundColor = UIColor(named: "Primary")
            
        default:
            break
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
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
                passwordIconImageView.tintColor = UIColor(named: "Primary")
                passwordSeparator.backgroundColor = UIColor(named: "Primary")
                loginButton.tintColor = .white
                loginButton.backgroundColor = UIColor(named: "Primary")
            } else {
                passwordIconImageView.tintColor = UIColor(named: "Font2")
                passwordSeparator.backgroundColor = UIColor(named: "Font2")
                loginButton.tintColor = .white
                loginButton.backgroundColor = UIColor(named: "Font2")
            }
        default :
            break
        }
    }
}

extension UIViewController {
    func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Login")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UIViewController {
    func showResetEmailController() {
        let storyboard = UIStoryboard(name: "ResetPassword", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "email_reset")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
