//
//  LoginViewController.swift
//  NavigationControllerTutorial
//
//  Created by 김태형 on 27/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController{
    
    @IBOutlet weak var UserNameTextField: UITextField!
    
    @IBOutlet weak var UserPswTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        navigateToMainInterFace()
    }
    
    private func navigateToMainInterFace(){
        let mainStoryboard = UIStoryboard(name:"Main",bundle: Bundle.main)
        guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else{
            return
        }
        present(mainNavigationVC,animated:true,completion: nil)
    }
    
    
}
