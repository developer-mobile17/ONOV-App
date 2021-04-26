//
//  NewsFeedVideoWithtextCell.swift
//  ONOV
//
//  Created by wbmb on 22/04/21.
//

import UIKit

class NewsFeedVideoWithtextCell: UITableViewCell {
    
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var lblTitle: UILabel!
    
    @IBOutlet var postDataTime: UILabel!
    @IBOutlet var txtData: UILabel!
    @IBOutlet var imgData: UIImageView!
    
    @IBOutlet var btnPlayVideo: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
