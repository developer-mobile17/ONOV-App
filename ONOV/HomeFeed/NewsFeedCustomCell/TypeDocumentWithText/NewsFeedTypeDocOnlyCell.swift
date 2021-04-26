//
//  NewsFeedTypeDocOnlyCell.swift
//  ONOV
//
//  Created by wbmb on 22/04/21.
//

import UIKit
import PDFKit
class NewsFeedTypeDocOnlyCell: UITableViewCell {
    
    
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet var postDataTime: UILabel!
    @IBOutlet var txtData: UILabel!
    @IBOutlet var docData: PDFView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
