//
//  followerCell.swift
//  ONOV
//
//  Created by wbmb on 19/04/21.
//

import UIKit

class followerCell: UITableViewCell {
    @IBOutlet var imgUserProfile: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var btnRemove: UIButton!
    @IBOutlet var btnUnfollow:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
