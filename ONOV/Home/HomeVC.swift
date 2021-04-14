//
//  HomeVC.swift
//  ONOV
//
//  Created by anil kumar on 26/02/21.
//

import UIKit
struct HomeDataModel {
    let homeCellImg : String
}

class HomeVC: UIViewController {


    @IBOutlet var btnNotification: UIButton!
    @IBOutlet var objTable: UITableView!


    var arrHome = [HomeDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        arrHome = [HomeDataModel(homeCellImg: "img1"),HomeDataModel(homeCellImg: "img2"),HomeDataModel(homeCellImg: "img1"),HomeDataModel(homeCellImg: "img2")]
    }
    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }

}

extension HomeVC: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHome.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let HomearrayData = arrHome[indexPath.row]
        homeCell.imgHomeCell.image = UIImage(imageLiteralResourceName: HomearrayData.homeCellImg)




        //TODO:- UIButton Action Set
        homeCell.btnComment.tag = indexPath.row
        homeCell.btnComment .addTarget(self, action: #selector(btnCommentClicked), for:.touchUpInside)

        return homeCell

    }

}


//MARK:- Button Action Clicked
extension HomeVC{

    @objc func btnCommentClicked(sender: UIButton){
        let vcHomeComment = self.storyboard?.instantiateViewController(identifier: "HomeCommentVC") as! HomeCommentVC
        self.navigationController?.pushViewController(vcHomeComment, animated: true)
    }




    }

