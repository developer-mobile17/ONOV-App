//
//  EventListingVC.swift
//  ONOV
//
//  Created by anil kumar on 08/04/21.
//

import UIKit

class EventListingVC: UIViewController {

    @IBOutlet var objTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCreateEvent(_ sender: Any){
        let vcCreateEvent = self.storyboard?.instantiateViewController(identifier: "CreateEventVC")as!CreateEventVC
        self.navigationController?.pushViewController(vcCreateEvent, animated: true)
    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }


}

extension EventListingVC: UITableViewDataSource,UITableViewDelegate {

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellEventListing = tableView.dequeueReusableCell(withIdentifier: "EventListingCell", for: indexPath) as! EventListingCell
        return cellEventListing
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcEventDetails = self.storyboard?.instantiateViewController(identifier: "EventListingDetailsVC") as! EventListingDetailsVC
        self.navigationController?.pushViewController(vcEventDetails, animated: true)
        
    }


}
