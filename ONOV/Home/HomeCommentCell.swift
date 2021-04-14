//
//  HomeCommentCell.swift
//  ONOV
//
//  Created by anil kumar on 26/02/21.
//

import UIKit

class HomeCommentCell: UITableViewCell {


    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblPostTime: UILabel!
    @IBOutlet var lblComment: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
