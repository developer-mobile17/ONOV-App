//
//  SettingVC.swift
//  ONOV
//
//  Created by anil kumar on 08/03/21.
//

import UIKit
struct SettingModel {
    let title:String

}

class SettingVC: UIViewController {
    @IBOutlet var tableSetting:UITableView!

    var arrSettingData = [SettingModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.LoadSettingData()
    }

    func LoadSettingData() {
        self.tableSetting.tableFooterView = UIView()

        arrSettingData = [SettingModel(title: "Notification"),SettingModel(title: "Receive anonymous donations"),SettingModel(title: "Reset Password")]

    }

    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }

}

extension SettingVC: UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSettingData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSetting = tableView.dequeueReusableCell(withIdentifier: "CellSetting", for: indexPath)
        let SettingData = arrSettingData[indexPath.row]
        cellSetting.textLabel?.text = SettingData.title


        // TODO:- Add Custom UISwitch Here..
        if indexPath.row == 0 {
            let switchView = UISwitch()
            cellSetting.accessoryView = switchView
            switchView.tag = indexPath.row
        }
        else if indexPath.row == 1 {
            let switchView = UISwitch()
            cellSetting.accessoryView = switchView
            switchView.tag = indexPath.row
        }

        else {

        }
        
        return cellSetting
    }


}
