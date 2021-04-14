//
//  AllWinnerCell.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class AllWinnerCell: UITableViewCell {
    
    @IBOutlet var imgWinnerUser: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblRank: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
