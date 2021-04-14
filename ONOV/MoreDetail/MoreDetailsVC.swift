//
//  MoreDetailsVC.swift
//  ONOV
//
//  Created by anil kumar on 03/03/21.
//

import UIKit

struct StatsResponse {
    let debateTitle:String
    let debateVotes:String
}
struct WinningResponse {
    let debateTitle:String
    let debateDate:String
}


class MoreDetailsVC: UIViewController {
    @IBOutlet var tblStats:UITableView!

   var arrStats   = [StatsData]()
   var arrWinning = [WinningResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblStats.tableFooterView = UIView()
        self.setupStatsData()

    }

    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    func setupStatsData(){
       
        ProgressHUD.show()
        APIManger.shareInstance.callingGetStatsAPI() {(result) in

            switch result{
            case.success(let json):
           // print(json!)

            ProgressHUD.dismiss()
            self.arrStats = (json as! StatsModelResponse).data!
                if self.arrStats.count == 0 {
                   self.showAlert(alertMessage: (json as!StatsModelResponse).msg!)
                }
                else {
                    self.tblStats.reloadData()
                }
            case.failure(let err):
                print(err.localizedDescription)
            }

        }
    }

    func setupWinningData() {

        arrWinning = [WinningResponse(debateTitle: "Debate Title", debateDate: "200"),WinningResponse(debateTitle: "Debate Title", debateDate: "100"),WinningResponse(debateTitle: "Debate Title", debateDate: "500"),WinningResponse(debateTitle: "Debate Title", debateDate: "200"),WinningResponse(debateTitle: "Debate Title", debateDate: "200"),WinningResponse(debateTitle: "Debate Title", debateDate: "200")
        ]

    }

    func setupButtonAction() {

    }

}


extension MoreDetailsVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMoreDetails = tableView.dequeueReusableCell(withIdentifier: "MoreDetailCell", for: indexPath) as! MoreDetailCell
        let MoredetailModel = arrStats[indexPath.row]
        cellMoreDetails.lblDebateTitle.text = MoredetailModel.notificationText
        cellMoreDetails.lblDebateSubTitle.text = MoredetailModel.notificationText
        return cellMoreDetails
    }


}
