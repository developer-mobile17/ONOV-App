//
//  DonationVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class DonationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

}

extension DonationVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDonation = tableView.dequeueReusableCell(withIdentifier: "DonationCell", for: indexPath) as! DonationCell
        return cellDonation
    }


}
