//
//  HomeNewsFeedVC.swift
//  ONOV
//
//  Created by anil kumar on 05/04/21.
//

import UIKit
struct newsFeedDataText {
    let userImg:String?
    let userName:String
    let postDataTime:String
    let txtData: String
   // let imgData: String?
}



struct newsFeedDataImage {
    let userImg:String?
    let userName:String
    let postDataTime:String
    let imgData: String?
}

class HomeNewsFeedVC: UIViewController {

    @IBOutlet var objTable: UITableView!
    var arrNewsFeedData = [newsFeedDataText]()
    var arrNewsFeedImg = [newsFeedDataImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNewsFeedDataText()
        self.setUpNewsFeedDataImage()

    }

    func setUpNewsFeedDataText() {
        arrNewsFeedData = [newsFeedDataText(userImg: "comment1",
                                       userName: "CNN",
                                       postDataTime: "1 min",
                                       txtData: """
President Joe Biden says he doesn't plan to speak with any
senators about former President Donald Trump's
impeachment trial or how they will vote.
I'm just anxious to see what my Republican friends do,
if they stand up, Biden said.
""")]

    }

    func setUpNewsFeedDataImage() {
        arrNewsFeedImg = [newsFeedDataImage(userImg: "comment1", userName: "Vikas", postDataTime: "5 min", imgData:"img1" )]

    }
}

extension HomeNewsFeedVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNewsFeedImg.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {




//            let cellHomeFeedText = tableView.dequeueReusableCell(withIdentifier: "HomeFeedCellTypeText", for: indexPath) as! HomeFeedCellTypeText
//
//
//            let HomeFeedModel = arrNewsFeedData[indexPath.row]
//            cellHomeFeedText.userImg.image = UIImage(imageLiteralResourceName: HomeFeedModel.userImg ?? "")
//            cellHomeFeedText.userName.text = HomeFeedModel.userName
//            cellHomeFeedText.postDataTime.text = HomeFeedModel.postDataTime
//            cellHomeFeedText.txtData.text = HomeFeedModel.txtData
//    //        cellHomeFeed.imgData.image = UIImage(imageLiteralResourceName: HomeFeedModel.imgData ?? "")
//
//            return cellHomeFeedText
//
//        }

//        if indexPath.row == 1
//
        let cellHomeFeedImg = tableView.dequeueReusableCell(withIdentifier: "HomeFeedTypeImage", for: indexPath) as! HomeFeedTypeImage


        let HomeFeedModel = arrNewsFeedImg[indexPath.row]
        cellHomeFeedImg.userImg.image = UIImage(imageLiteralResourceName: HomeFeedModel.userImg ?? "")
        cellHomeFeedImg.userName.text = HomeFeedModel.userName
        cellHomeFeedImg.postDataTime.text = HomeFeedModel.postDataTime

        cellHomeFeedImg.imgData.image = UIImage(imageLiteralResourceName: HomeFeedModel.imgData ?? "")

        return cellHomeFeedImg
//
//
        }



}

class HomeFeedCellTypeText : UITableViewCell {
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var postDataTime: UILabel!
    @IBOutlet var txtData: UILabel!
   // @IBOutlet var imgData: UIImageView!
}


