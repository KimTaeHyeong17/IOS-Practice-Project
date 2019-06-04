//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 김태형 on 03/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var myTableView: UITableView!
    
    let dataArray = ["zebra","turtle","bear","bird","cat","dog"]
    var hugeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...100 {
            hugeArray.append(dataArray[(index%6)])
        }
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hugeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get the data for this row
        let rowData = hugeArray[indexPath.row]
        
        //Get a cell to display
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        cell.textLabel?.text = rowData
        
        //return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(hugeArray[indexPath.row])
    }
    
}

