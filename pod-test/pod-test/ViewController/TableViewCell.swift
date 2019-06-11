//
//  TableViewCell.swift
//  pod-test
//
//  Created by 김태형 on 05/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

protocol tableItem {
    func onClickCell(index : Int)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    
    var cellDelegate : tableItem?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func itemClick(_ sender: Any) {
        cellDelegate?.onClickCell(index: index!.row)
    }
    
}
