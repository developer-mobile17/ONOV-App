//
//  HomeFeedTypeImage.swift
//  ONOV
//
//  Created by anil kumar on 06/04/21.
//

import UIKit

class HomeFeedTypeImage: UITableViewCell {

    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var postDataTime: UILabel!
  //  @IBOutlet var txtData: UILabel!
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
