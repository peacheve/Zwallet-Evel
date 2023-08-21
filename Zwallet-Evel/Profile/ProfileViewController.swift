//
//  ProfileViewController.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 20/08/23.
//

import  UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var logOutButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
    }
    
    @IBAction func logOutTapped (_ sender: Any){
        AuthNetwork().logout { data in
            if data != nil {
                let alert = UIAlertController(title: "Logout", message: "로그아웃이 확실합니까? \n Are you sure want to logout?", preferredStyle: .alert)
                // 로그아웃이 확실합니까?
                alert.addAction(UIAlertAction(title: "Logout", style: .destructive) { action in
                    self.logout()
                })
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            } else {
                print("Error")
            }
        }
    }
}


extension ProfileViewController {
    func logout() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Login")
        
        let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow})
        window?.rootViewController = UINavigationController(rootViewController: viewController)
    }
}
