//
//  DestinationViewController.swift
//  SeguePractice
//
//  Created by 김태형 on 07/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import Foundation
import UIKit

class DestinationViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        //modally presented\
        dismiss(animated: true, completion: nil)
        
        //pop?
        navigationController?.popViewController(animated: true)

    }
    
    
    
}
