//
//  DonationVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class DonationVC: UIViewController {

    @IBOutlet weak var objSegment: UISegmentedControl!
    @IBOutlet weak var lblAmountFrom: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objSegment.setTitle("Sent ($300)", forSegmentAt: 0)
    }
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionSegmentClicked(_ sender: Any) {
        switch objSegment.selectedSegmentIndex {
        case 0:
            lblAmountFrom.text = "Sent From"
        case 1:
            lblAmountFrom.text = "Received From"
        default:
            break
            
        }
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
