//
//  FriendCell.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/15.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    static let identifier: String = "FriendCell"
    
    @IBOutlet var friendImageView: UIImageView!
    @IBOutlet var friendnameLabel: UILabel!
    @IBOutlet var friendmesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFriendInformation(proImgName: String, name: String, mess: String){
        friendImageView.image = UIImage(named: proImgName)
        friendnameLabel.text = name
        friendmesLabel.text = mess
    }

}
