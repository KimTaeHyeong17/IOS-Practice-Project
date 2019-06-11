//
//  ViewController.swift
//  SeguePractice
//
//  Created by 김태형 on 07/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SegueTapped(_ sender: Any) {
        //        self.storyboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "DestinationViewController") as? DestinationViewController else{
            print("can't find viewController")
            return
        }
        
        //setting transition style
        destinationViewController.modalTransitionStyle = .crossDissolve
        present(destinationViewController,animated:true,completion: nil)
        //push
        //navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    
    
    
    
    
}

