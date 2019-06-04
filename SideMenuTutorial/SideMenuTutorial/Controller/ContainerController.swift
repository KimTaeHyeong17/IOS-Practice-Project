//
//  ContainerController.swift
//  SideMenuTutorial
//
//  Created by 김태형 on 04/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    //MARK: - Properties
    
    
    //Mark: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: - Handlers
    
    func configureHomeController(){
        let homeController = HomeController()
        let controller = UINavigationController(rootViewController: homeController)
        
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    func configureMenuController(){
        
    }
    
    
}
