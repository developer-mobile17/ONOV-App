//
//  DebateRequestVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class DebateRequestVC: UIViewController {
    @IBOutlet var tblDebateReq: UITableView!
    var arrGetDebateRequest = [GetDebateRequestDate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblDebateReq.tableFooterView = UIView()

        DispatchQueue.main.async {
            self.callingDebateRequestAPI()
        }


    }
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

}

extension DebateRequestVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGetDebateRequest.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDebateRequest = tableView.dequeueReusableCell(withIdentifier: "DebateRequestCell", for: indexPath) as! DebateRequestCell
        let DebateRequestModel = arrGetDebateRequest[indexPath.row]
        cellDebateRequest.lblDebateTitle.text = DebateRequestModel.title
        cellDebateRequest.lblDebateDate.text = DebateRequestModel.date
        cellDebateRequest.lblDebateTime.text = DebateRequestModel.time


        cellDebateRequest.btnView.tag = indexPath.row
        cellDebateRequest.btnView .addTarget(self, action: #selector(btnViewClicked), for:.touchUpInside)


        return cellDebateRequest
    }


}



//MARK:- Button remove Cart Item Clicked
extension DebateRequestVC{

    @objc func btnViewClicked(sender: UIButton){
        let senderID = arrGetDebateRequest[sender.tag]

        let vcDebateReqDetail = self.storyboard?.instantiateViewController(identifier: "DebateRequestDetailVC") as! DebateRequestDetailVC
        self.navigationController?.pushViewController(vcDebateReqDetail, animated: true)
        
        


    }
}

extension DebateRequestVC {
    func callingDebateRequestAPI(){

        ProgressHUD.show()
        APIManger.shareInstance.callingGetDebateRequestAPI() {(result) in

            switch result{
            case.success(let json):
                ProgressHUD.dismiss()
                self.arrGetDebateRequest = (json as! GetDebateModelResponse).date!
                self.tblDebateReq.reloadData()

            case.failure(let err):
                print(err.localizedDescription)
            }

        }

    }
}
