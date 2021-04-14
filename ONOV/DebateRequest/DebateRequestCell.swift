//
//  DebateRequestCell.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class DebateRequestCell: UITableViewCell {

    @IBOutlet var lblDebateTitle: UILabel!
    @IBOutlet var lblDebateDate: UILabel!
    @IBOutlet var lblDebateTime: UILabel!
    @IBOutlet var btnView: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
