//
//  DatePopupViewController.swift
//  pod-test
//
//  Created by 김태형 on 05/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit




class DatePopupViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveDate(_ sender: UIButton) {
        dismiss(animated: true) 
        
    }
    

}
