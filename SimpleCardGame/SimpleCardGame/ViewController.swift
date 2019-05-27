//
//  ViewController.swift
//  SimpleCardGame
//
//  Created by 김태형 on 27/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    

    @IBAction func dealTapped(_ sender: Any) {
        //randomize some numbers
        let leftNumber = Int.random(in: 2...14);
        let rightNumber = Int.random(in: 2...14)

        //Update ImageViews
        leftImageView.image = UIImage(named: "card\(leftNumber)");
        rightImageView.image = UIImage(named: "card\(rightNumber)");
        
        
        if(leftNumber > rightNumber){
            //LeftSide Win
            leftScore+=1
            leftScoreLabel.text = String(leftScore)
        }else if( leftNumber < rightNumber){
            //RightSid Win
            rightScore+=1
            rightScoreLabel.text = String(rightScore)
        }else{
            //Tie
        }
        
    }
    
}

