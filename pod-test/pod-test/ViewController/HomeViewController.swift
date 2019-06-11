//
//  HomeViewController.swift
//  pod-test
//
//  Created by 김태형 on 04/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewVisibility: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var viewBackground: UIView!

    var showMenu = false
    var showView = true
    
//    let gesture = UITapGestureRecognizer(target:self, action: #selector(checkAction))
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))

        viewBackground.addGestureRecognizer(tap)
        viewBackground.addGestureRecognizer(rightSwipe)
        viewBackground.addGestureRecognizer(leftSwipe)


    }
    
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended  {
            switch sender.direction{
            case .right:
                //드로우어 열리게
                leadingConstraint.constant = 0
                viewBackground.backgroundColor = UIColor.darkGray
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
                break;
            case .left:
                //드로우어 닫히게
                //TODO: 안되넹
                leadingConstraint.constant = -240
                viewBackground.backgroundColor = UIColor.white
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
                break;
            default:
                break;
            }
            showView = !showView

        }
    }
    
    //화면 누르면 드로우어 닫히게
    @objc func handleTap(sender : UITapGestureRecognizer){
        guard sender.view != nil else{ return }
        
        if sender.state == .ended{
            //callapse sidebar menu
            leadingConstraint.constant = -240
            viewBackground.backgroundColor = UIColor.white
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            showMenu = !showMenu
        }
    }

    
    
    
    @IBAction func btnViewVisibility(_ sender: Any) {
        if(showView == true){
            viewVisibility.isHidden = true
        }else{
            viewVisibility.isHidden = false
        }
        showView = !showView
    }
    
    
    //MARK: -SideBarMenu
    @IBAction func openSIdeMenu(_ sender: Any) {
        if showMenu == true { //hide drawer
            leadingConstraint.constant = -240
            viewBackground.backgroundColor = UIColor.white
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }else{ //show drawer
            leadingConstraint.constant = 0
            viewBackground.backgroundColor = UIColor.darkGray
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        showMenu = !showMenu
    }
    
}

//autolayout segue 쓰면 let selectionVC = storyboard?.instantiateViewController(withIdentifier:"asd") as! MenuManagement View
//extension HomeViewController: selectionDelegate {
//    func onItemClick(name :String){
//          label.text = name
//    }
//}
