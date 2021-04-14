//
//  DonationCell.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class DonationCell: UITableViewCell {
    @IBOutlet var lblReceivedFrom: UILabel!
    @IBOutlet var lblAmount: UILabel!
    @IBOutlet var lblDate: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
