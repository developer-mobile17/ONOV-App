//
//  PetitionListVC.swift
//  ONOV
//
//  Created by anil kumar on 25/03/21.
//

import UIKit

class PetitionListVC: UIViewController {

    @IBOutlet var tblPetitionList: UITableView!
    @IBOutlet var btnStartPetition: UIButton!
    var arrPetitionList = [PetitionArray]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tblPetitionList.tableFooterView = UIView()


    }

    override func viewWillAppear(_ animated: Bool) {
        self.callingViewPetitionListAPI()
    }


    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }

    @IBAction func actionStartPetition(_ sender: Any) {
        let vcStartPetitionVC = self.storyboard?.instantiateViewController(identifier: "StartPetitionVC")as!StartPetitionVC
        self.navigationController?.pushViewController(vcStartPetitionVC, animated: true)
    }
}

extension PetitionListVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPetitionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPetition = tableView.dequeueReusableCell(withIdentifier: "PetitionListCell", for: indexPath) as! PetitionListCell
        let petitionModel = arrPetitionList[indexPath.row]
        cellPetition.lblPetitionSentFrom.text = petitionModel.sentFrom
        cellPetition.lblPetitionAmount.text = "\("$")\(petitionModel.amount ?? "00")"
        cellPetition.lblPetitionDate.text = petitionModel.petitionDate

        return cellPetition
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcSignPetitionVC = self.storyboard?.instantiateViewController(identifier: "SignPetitionVC")as!SignPetitionVC
        self.navigationController?.pushViewController(vcSignPetitionVC, animated: true)
    }


}




extension PetitionListVC: UIScrollViewDelegate {
    // Liver here
    // Set the alpha value of the button to 0 when scrolling starts
    func scrollViewWillBeginDragging (_ scrollView: UIScrollView) {
        UIView.animate (withDuration: 0.25) {
                    self.btnStartPetition.alpha = 0
                }
    }
    // Set the alpha value of the button to 1 at the end of scrolling
    func scrollViewDidEndDecelerating (_ scrollView: UIScrollView) {
        UIView.animate (withDuration: 0.25) {
                    self.btnStartPetition.alpha = 1
                }
    }
}
class PetitionListCell: UITableViewCell {

    @IBOutlet var lblPetitionSentFrom: UILabel!
    @IBOutlet var lblPetitionDate: UILabel!
    @IBOutlet var lblPetitionAmount: UILabel!

}

extension PetitionListVC {
    func callingViewPetitionListAPI(){

        ProgressHUD.show()
        APIManger.shareInstance.callingGetPetitionListAPI() {(result) in

            switch result {
            case.success(let json):
                ProgressHUD.dismiss()
                self.arrPetitionList = (json as! GetPetitionListResponse).petitionArray!
                self.tblPetitionList.reloadData()

            case.failure(let err):
                print(err.localizedDescription)
            }
    }
  }
}
