//
//  NotificationVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit
struct NotificationModel {
    let notificationSubTitle:String
}

class NotificationVC: UIViewController {
    @IBOutlet var tblNotification:UITableView!
    var arrNotificaton = [NotificationData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblNotification.estimatedRowHeight = UITableView.automaticDimension
        self.loadNotificationData()
    }

    func loadNotificationData() {
        ProgressHUD.show()
        APIManger.shareInstance.callingGetNotificatoinAPI() {(result) in

            switch result{
            case.success(let json):
           // print(json!)

            ProgressHUD.dismiss()
            self.arrNotificaton = (json as! NotificationModelResponse).data!
                if self.arrNotificaton.count == 0 {
                   self.showAlert(alertMessage: (json as!NotificationModelResponse).msg!)
                }
            self.tblNotification.reloadData()

            case.failure(let err):
                print(err.localizedDescription)
            }

        }


    }
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

}

extension NotificationVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotificaton.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNotification = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        let NotificationData = arrNotificaton[indexPath.row]
        cellNotification.lblNotificationSubTitle.text = NotificationData.notificationText
        cellNotification.lblNotificationDate.text = NotificationData.create_at

        return cellNotification
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}
