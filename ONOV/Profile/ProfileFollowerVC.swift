//
//  ProfileFollowerVC.swift
//  ONOV
//
//  Created by wbmb on 19/04/21.
//

import UIKit

class ProfileFollowerVC: UIViewController {
    var checkType:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let type = checkType {
            title = type
        }
    }

}

extension ProfileFollowerVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFollowers = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! followerCell
        if checkType == "Followers" {
            cellFollowers.btnUnfollow.isHidden = true
        }
        else if checkType == "Following" {
            
            cellFollowers.btnRemove.isHidden = true
        }
        else {
            cellFollowers.btnRemove.isHidden = true
            cellFollowers.btnUnfollow.isHidden = true
        }
        
        return cellFollowers
    }
}
