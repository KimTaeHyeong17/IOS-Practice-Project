//
//  MenuManagementViewController.swift
//  pod-test
//
//  Created by 김태형 on 05/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

protocol TableClickedItem {
    func ChoicedItem(name :String)
}

class MenuManagementViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, tableItem{
    
    @IBOutlet weak var tableView: UITableView!

    var selectionDelegate : TableClickedItem!
    
    var sampleData = ["Coffee","Cake","Drinks","Bread","Cookies","Fruit"]
    var shit = "SAd"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.Name.text = sampleData[indexPath.row]
        cell?.cellDelegate = self
        cell?.index = indexPath 
        return cell!
    }
    
    func onClickCell(index: Int) {
        print("\(index) clicked")
        selectionDelegate.ChoicedItem(name: sampleData[index])
    }
    
}
