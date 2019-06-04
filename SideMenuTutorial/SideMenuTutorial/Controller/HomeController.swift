//
//  HomeController.swift
//  SideMenuTutorial
//
//  Created by 김태형 on 04/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    
    //Mark: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    //MARK: - Handlers
    
    @objc func handleMenuToggle(){
        print("toggle menu")
    }
    
    func configureNavagationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "appicon_1024"), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    
}
