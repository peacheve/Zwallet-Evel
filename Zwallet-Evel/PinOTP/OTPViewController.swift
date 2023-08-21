//
//  OTPViewController.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 17/08/23.
//

import UIKit

import UIKit

class OTPViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    @IBOutlet weak var otpTextField5: UITextField!
    @IBOutlet weak var otpTextField6: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextField1.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        otpTextField2.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        otpTextField3.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        otpTextField4.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        otpTextField5.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        otpTextField6.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        
        otpTextField1.delegate = self
        otpTextField2.delegate = self
        otpTextField3.delegate = self
        otpTextField4.delegate = self
        otpTextField5.delegate = self
        otpTextField6.delegate = self
        
        confirmButton.isEnabled = false
    }
    
    
    
    @objc func textDidChange(textField: UITextField) {
        
        let text = textField.text
        if text?.count == 1{
            switch textField{
            case otpTextField1:
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                otpTextField3
                    .becomeFirstResponder()
            case otpTextField3:
                otpTextField4
                    .becomeFirstResponder()
            case otpTextField4:
                otpTextField5
                    .becomeFirstResponder()
            case otpTextField5:
                otpTextField6
                    .becomeFirstResponder()
            case otpTextField6:
                otpTextField6
                    .becomeFirstResponder()
            default:
                break
                
            }
        }
        if text?.count == 0{
            switch textField{
            case otpTextField1:
                otpTextField1.becomeFirstResponder()
            case otpTextField2:
                otpTextField1
                    .becomeFirstResponder()
            case otpTextField3:
                otpTextField2
                    .becomeFirstResponder()
            case otpTextField4:
                otpTextField3
                    .becomeFirstResponder()
            case otpTextField5:
                otpTextField4
                    .becomeFirstResponder()
            case otpTextField6:
                otpTextField5
                    .becomeFirstResponder()
            default:
                break
                
            }
        }
    }
    
    
    //    func textFieldDidBeginEditing(_ textField: UITextField) {
    //        switch textField {
    //        case otpTextField1:
    //            otpTextField1.layer.borderColor = UIColor(named: "Primary")?.CGColor
    //        case otpTextField2:
    //            otpTextField2.tintColor = UIColor(named: "Primary")
    //        case otpTextField3:
    //            otpTextField3.tintColor = UIColor(named: "Primary")
    //        case otpTextField4:
    //            otpTextField4.tintColor = UIColor(named: "Primary")
    //        case otpTextField5:
    //            otpTextField5.tintColor = UIColor(named: "Primary")
    //        case otpTextField6:
    //            otpTextField6.tintColor = UIColor(named: "Primary")
    //
    //        default:
    //            break
    //        }
    //    }
    //
    //    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    //        switch textField {
    //        case otpTextField1:
    //            if !(otpTextField1.text ?? "").isEmpty {
    //                otpTextField1.tintColor =
    //            }
    //        }
    //    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Delay the update to make sure the text field's text has been updated
            DispatchQueue.main.async {
                self.updateConfirmButtonState()
            }
            return true
        }
    
    
    func updateConfirmButtonState() {
        let textField1 = otpTextField1.text ?? ""
        let textField2 = otpTextField1.text ?? ""
        let textField3 = otpTextField1.text ?? ""
        let textField4 = otpTextField1.text ?? ""
        let textField5 = otpTextField1.text ?? ""
        let textField6 = otpTextField1.text ?? ""
        
        //enable button if text field are not empty
        
//        var allFieldSFilled = [textField1, textField2, textField3, textField4, textField5, textField6] { $0.text.isEmpty == false}
//        confirmButton.isEnabled = allFieldSFilled
        let allFieldsFilled = [textField1, textField2, textField3, textField4, textField5, textField6].filter { !$0.isEmpty }.count > 2
        confirmButton.isEnabled = allFieldsFilled
        if confirmButton.isEnabled {
                confirmButton.tintColor = .white
                confirmButton.backgroundColor = UIColor(named: "Primary")
            } else {
                confirmButton.tintColor = .white
                confirmButton.backgroundColor = UIColor(named: "DisabledButton")
        }

        
    }
    @IBAction func confirmButtonTapped(_ sender: Any) {
        showViewController()
    }
}

extension UIViewController {
    func showViewController() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "homepage")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

