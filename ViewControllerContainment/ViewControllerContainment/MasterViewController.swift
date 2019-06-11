//
//  MasterViewController.swift
//  ViewControllerContainment
//
//  Created by 김태형 on 07/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //lazy property --> instaintiate when user neend it
    lazy var summaryViewController: SummaryViewController = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        
        self.addViewControllerAsChildViewController(childViewController : viewController)
        
        return viewController
    }()
    
    lazy var sessionsViewController : SessionViewController = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SessionViewController") as! SessionViewController
        
        self.addViewControllerAsChildViewController(childViewController : viewController)
        
        return viewController
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    
    //MARK: -Helper Methods
    private func addViewControllerAsChildViewController(childViewController : UIViewController){
        addChild(childViewController)
        
        view.addSubview(childViewController.view)
        
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth,.flexibleWidth]
        
        childViewController.didMove(toParent: self)
        
    }
    
    
    
    //MARK: - View Methods
    private func setupView(){
        setupSegmentedControl()
        updateView()
    }
    private func updateView(){
        summaryViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
        sessionsViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
    }
    
    //MARK: -
    private func setupSegmentedControl(){
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Session", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender: )), for: .valueChanged)
        segmentedControl?.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(sender : UISegmentedControl) {
        updateView()
    }
}

