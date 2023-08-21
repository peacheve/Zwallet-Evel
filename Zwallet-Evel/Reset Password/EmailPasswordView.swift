//
//  EmailPasswordView.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 21/08/23.
//

import UIKit

class EmailPasswordView: UIViewController {
    
    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailSeparator: UIView!
    @IBOutlet weak var confirmButton: CustomButton!
    @IBOutlet weak var emailPopUpPage: CustomPopUpPage!
    
    
    override func viewDidLoad() {
        setup()
    }
    
    func setup() {
        // confirmButton(enabled: false)
        emailTextField.delegate = self
    }
    
    func confirmButton(enabled: Bool) {
        confirmButton.isEnabled = false
    }
    
    @IBAction func confirmButtonTapped(_sender: Any) {
        let storyboard = UIStoryboard(name: "ResetPassword", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "password_reset") as? ResetPasswordController
        viewController?.email = self.emailTextField.text!
        navigationController?.pushViewController(viewController!, animated: true)
    }
}
extension EmailPasswordView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailIcon.tintColor = UIColor(named: "Primary")
            emailSeparator.backgroundColor = UIColor(named: "Primary")
            confirmButton.tintColor = .white
            confirmButton.backgroundColor = UIColor(named: "Primary")
            
        default:
            break
        }
    }
        func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            switch textField {
            case emailTextField:
                if !(emailTextField.text ?? "").isEmpty {
                    emailIcon.tintColor = UIColor(named: "Primary")
                    emailSeparator.tintColor = UIColor(named: "Primary")
                    confirmButton.tintColor = .white
                    confirmButton.backgroundColor = UIColor(named: "Primary")
                } else {
                    emailIcon.tintColor = UIColor(named: "Font2")
                    emailSeparator.tintColor = UIColor(named: "Font2")
                    confirmButton.tintColor = .white
                    confirmButton.backgroundColor = UIColor(named: "Font2")
                    
                }
            default :
                break
            }
        }
    }
