//
//  NewsFeedTypeImgeWithTextCell.swift
//  ONOV
//
//  Created by wbmb on 22/04/21.
//

import UIKit

class NewsFeedTypeImgeWithTextCell: UITableViewCell {
    
    
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var lblPostTitle: UILabel!
    @IBOutlet var postDataTime: UILabel!
    @IBOutlet var txtData: UILabel!
    @IBOutlet var imgData: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
