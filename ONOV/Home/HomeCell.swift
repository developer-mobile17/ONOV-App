//
//  HomeCell.swift
//  ONOV
//
//  Created by anil kumar on 26/02/21.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet var vwObj: UIView!
    @IBOutlet var imgHomeCell: UIImageView!
    @IBOutlet var lblLikeCount: UILabel!
    @IBOutlet var lblCommentCount: UILabel!
    @IBOutlet var lblVotingCount: UILabel!
    @IBOutlet var lblShareCount: UILabel!



    @IBOutlet var btnLike: UIButton!
    @IBOutlet var btnComment: UIButton!
    @IBOutlet var btnVoting: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnDonate: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
