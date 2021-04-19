//
//  ProfileFollowerVC.swift
//  ONOV
//
//  Created by wbmb on 19/04/21.
//

import UIKit

class ProfileFollowerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ProfileFollowerVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFollowers = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath)
         return cellFollowers
    }
    
    
}
