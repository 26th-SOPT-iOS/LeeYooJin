//
//  MyCell.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/15.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    static let identifier: String = "MyCell"
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var mynameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
