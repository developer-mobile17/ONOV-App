//
//  HomeCommentVC.swift
//  ONOV
//
//  Created by anil kumar on 26/02/21.
//

import UIKit
struct HomeCommentDataModel {
    let Userimg : String
    let UserName : String
    let CommentTime : String
    let UserComment : String
}

class HomeCommentVC: UIViewController {
    var arrHomeComment = [HomeCommentDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        arrHomeComment = [HomeCommentDataModel(Userimg: "comment1", UserName: "Donald Rice", CommentTime: "- 5 min ago", UserComment: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs."),
                          HomeCommentDataModel(Userimg: "comment2", UserName: "Ova Kub", CommentTime: "- 5 min ago", UserComment: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs."),
                          HomeCommentDataModel(Userimg: "comment3", UserName: "Donald Rice", CommentTime: "- 5 min ago", UserComment: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs."),
                          HomeCommentDataModel(Userimg: "comment1", UserName: "Ova Kub", CommentTime: "- 5 min ago", UserComment: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.")

        ]
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }

}

extension HomeCommentVC: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHomeComment.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCommentCell = tableView.dequeueReusableCell(withIdentifier: "HomeCommentCell", for: indexPath) as! HomeCommentCell
        let HomearrayData = arrHomeComment[indexPath.row]
        homeCommentCell.imgUser.image = UIImage(imageLiteralResourceName: HomearrayData.Userimg)
        homeCommentCell.lblUserName.text = HomearrayData.UserName
        homeCommentCell.lblPostTime.text = HomearrayData.CommentTime
        homeCommentCell.lblComment.text  = HomearrayData.UserComment
        return homeCommentCell

    }

}


