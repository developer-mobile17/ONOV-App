//
//  SearchAddFriendorFollowVC.swift
//  ONOV
//
//  Created by anil kumar on 25/03/21.
//

import UIKit

class SearchAddFriendorFollowVC: UIViewController {

    @IBOutlet var objTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func actionBack(_ sender: Any) {
    }
    @IBAction func actionNotificationClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }
}

extension SearchAddFriendorFollowVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let searchAddFriendCell = tableView.dequeueReusableCell(withIdentifier: "SearchAddFriendOrFollowCell", for: indexPath) as! SearchAddFriendOrFollowCell
        return searchAddFriendCell
    }


}

class SearchAddFriendOrFollowCell: UITableViewCell {

}
