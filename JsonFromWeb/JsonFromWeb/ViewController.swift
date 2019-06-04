//
//  ViewController.swift
//  JsonFromWeb
//
//  Created by 김태형 on 29/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Weather.forecast(withLocation: "37.89267,-122.4233") { (results:[Weather]) in
            for result in results{
                print("\(result)\n\n")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
}

