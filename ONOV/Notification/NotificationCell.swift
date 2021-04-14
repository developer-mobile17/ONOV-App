//
//  NotificationCell.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class NotificationCell: UITableViewCell {
    @IBOutlet var lblNotificationTitle: UILabel!
    @IBOutlet var lblNotificationSubTitle: UILabel!
    @IBOutlet var lblNotificationDate: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
