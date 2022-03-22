//
//  PostCell.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 22.03.2022.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var ppImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
