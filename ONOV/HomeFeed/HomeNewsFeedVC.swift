//
//  HomeNewsFeedVC.swift
//  ONOV
//
//  Created by anil kumar on 05/04/21.
//

import UIKit
import Kingfisher


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
    var arrNewsFeedData = [DataFeed]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getHomeFeedData()
    }
}




extension HomeNewsFeedVC {
    func getHomeFeedData(){
        
        let FeedDataParam = HomeFeedRequest(userId: "1")
        APIManger.shareInstance.callingGetHomeFeedAPI(HomeFeedParam: FeedDataParam) { [self] result in
            switch result {
            case.success(let json):
                ProgressHUD.dismiss()
                let statusResponse = (json as! HomeFeedResponse).status
                if statusResponse == "success" {
                    self.arrNewsFeedData = (json as! HomeFeedResponse).data!
                    self.objTable.reloadData()
                

                }
                case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}



extension HomeNewsFeedVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNewsFeedData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cellHomeFeedText = tableView.dequeueReusableCell(withIdentifier: "HomeFeedCellTypeText", for: indexPath) as! HomeFeedCellTypeText

        let HomeFeedModel = arrNewsFeedData[indexPath.row]
        if let profilePicUrl = URL(string:"\(ImageBaseURL)\(String(describing: HomeFeedModel.profilePic))") {
            print(profilePicUrl)
            cellHomeFeedText.userImg.kf.setImage(with: profilePicUrl)
        }
        else {
            cellHomeFeedText.userImg.image = UIImage(imageLiteralResourceName: "amount")
        }
       
        
        
//        cellHomeFeedText.userImg.image = UIImage(imageLiteralResourceName: HomeFeedModel.userImg ?? "")
        cellHomeFeedText.userName.text = HomeFeedModel.name?.capitalized
        cellHomeFeedText.txtData.text = HomeFeedModel.description
        cellHomeFeedText.postDataTime.text = HomeFeedModel.created_at

//        cellHomeFeedText.imgData.image = UIImage(imageLiteralResourceName: HomeFeedModel.imgData ?? "")

        return cellHomeFeedText
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


