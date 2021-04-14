//
//  VotingTab.swift
//  ONOV
//
//  Created by anil kumar on 25/03/21.
//

import UIKit

class VotingTab: UIViewController {

    @IBOutlet var objTable: UITableView!
    @IBOutlet var lblLoginUserName: UILabel!
    @IBOutlet var imgLoginUser: UIImageView!
    @IBOutlet var lblLoginUserOnline: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showUserProfileData()

    }


    func showUserProfileData(){

    }
    @IBAction func actionNotificationClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }
}

extension VotingTab: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVoting = tableView.dequeueReusableCell(withIdentifier: "VotingTabCell", for: indexPath) as! VotingTabCell
        return cellVoting
    }


}

class VotingTabCell: UITableViewCell {

}


