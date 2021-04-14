//
//  ChatViewCell.swift
//  ONOV
//
//  Created by anil kumar on 03/03/21.
//

import UIKit

class ChatViewCell: UITableViewCell {

    @IBOutlet var vwBG: UIView!
    @IBOutlet var imgChatProfile: UIImageView!
    @IBOutlet var lblUserChatName: UILabel!
    @IBOutlet var lblUserMessage: UILabel!
    @IBOutlet var lblUserMessageTime: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
