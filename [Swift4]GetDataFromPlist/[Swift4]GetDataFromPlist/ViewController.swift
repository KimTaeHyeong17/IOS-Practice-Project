//
//  ViewController.swift
//  [Swift4]GetDataFromPlist
//
//  Created by 김태형 on 30/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //get dicRoot
        let dicRoot = NSDictionary.init(contentsOf: Bundle.main.path(forResource: "test", ofType: "plist"))
        let titleArrayFromDic : NSArray = NSArray.init(object: dicRoot!.ob)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

