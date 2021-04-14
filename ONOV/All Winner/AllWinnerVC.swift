//
//  AllWinnerVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class AllWinnerVC: UIViewController {

    var arrGetAllWinner = [Data]()
    @IBOutlet var objWinnerTable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.objWinnerTable.tableFooterView = UIView()

        DispatchQueue.main.async {
            self.callingGetAllWinnerAPI()
        }

    }
    
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

}

extension AllWinnerVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGetAllWinner.count
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAllWinner = tableView.dequeueReusableCell(withIdentifier: "AllWinnerCell", for: indexPath)
            as! AllWinnerCell
        let allWinnerData  = arrGetAllWinner[indexPath.row]
        let rank = allWinnerData.rank
        cellAllWinner.lblName.text = allWinnerData.fullName
        cellAllWinner.lblRank.text =  "\("#")\(String(rank!))"
        return cellAllWinner
    }


}

extension AllWinnerVC {
    func callingGetAllWinnerAPI(){

        ProgressHUD.show()
        APIManger.shareInstance.callingGetAllWinnerAPI() {(result) in

            switch result{
            case.success(let json):
           // print(json!)

            ProgressHUD.dismiss()
            self.arrGetAllWinner = (json as! GetAllWinnerResponse).data!
                self.objWinnerTable.reloadData()

            case.failure(let err):
                print(err.localizedDescription)
            }

        }

    }
}
