//
//  EventListingCell.swift
//  ONOV
//
//  Created by anil kumar on 09/04/21.
//

import UIKit

class EventListingCell: UITableViewCell {


    @IBOutlet var vwObj: UIView!
    @IBOutlet var lblEventTitle: UILabel!
    @IBOutlet var lblEventLikeCount: UILabel!
    @IBOutlet var lblEventDislikeCount: UILabel!
    @IBOutlet var lblEventCommentCount: UILabel!

    @IBOutlet var btnLikeCount: UIButton!
    @IBOutlet var btnDislikeCount: UIButton!
    @IBOutlet var btnCommentCount: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
