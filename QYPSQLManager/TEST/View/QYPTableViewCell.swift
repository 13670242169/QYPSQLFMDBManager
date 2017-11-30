//
//  QYPTableViewCell.swift
//  QYPSQLManager
//
//  Created by Apple on 2017/11/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class QYPTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var other: UILabel!
    var p:Person? {
        didSet{
            name.text = p?.name
            sex.text = p?.sex
            height.text = p?.height
            other.text = p?.other
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
