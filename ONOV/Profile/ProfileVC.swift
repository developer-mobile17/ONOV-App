//
//  ProfileVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfPhone: UITextField!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblTotalDonation: UILabel!
    
    
    @IBOutlet weak var btnFollowers: DesignableButton!
    @IBOutlet weak var btnFollowing: DesignableButton!
    @IBOutlet weak var btnDonors: DesignableButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            ProgressHUD.show(interaction: false)
            self.getUserInfo()
        }
        
    }

    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionUpdate(_ sender: Any) {
    }
    
    @IBAction func actionFollowerClicked(_ sender: Any) {
        guard let vcProfile = storyboard?.instantiateViewController(identifier: "ProfileFollowerVC") as? ProfileFollowerVC else{

            return
        }

        let navController = UINavigationController(rootViewController: vcProfile)
        present(navController, animated: true)
    }
    @IBAction func actionFollowingClicked(_ sender: Any) {
    }
    @IBAction func actionDonorClicked(_ sender: Any) {
    }
}

extension ProfileVC {
    func getUserInfo() {
        
       let getUserInfoParam = GetUserInfoRequest(Value: "3f8bg2P60RCxV", Key: "userRef")
        APIManger.shareInstance.callingGetUserInfoAPI(GetUserInfoParam: getUserInfoParam) { result in
            switch result {
            case.success(let json):
                ProgressHUD.dismiss()
                let statusResponse = (json as! GetUserInfoResponse).status
                if statusResponse == "success" {
                    let userInfo = (json as! GetUserInfoResponse).userInfo
                    if let userProfile = URL(string:"\(ImageBaseURL)\(String(describing: userInfo?.profilePic))"){
                        self.imgUser.kf.setImage(with: userProfile)
                    }
                    else {
                        self.imgUser.image = UIImage(systemName:"person.circle.fill")
                    }
                    
                    self.lblUserName.text = userInfo?.fullName?.capitalized
                    self.txfEmail.text = userInfo?.email
                    self.txfPhone.text = userInfo?.phone
                    
                    if let role = userInfo?.role {
                        self.lblRole.text = "\("Role :")\(role)"
                    }
                    if let donor = userInfo?.donationsVisible {
                        self.lblTotalDonation.text = "\("Total Donations") \(donor)"
                    }
                    if let donorCount = userInfo?.donationsVisible {
                        self.btnDonors .setTitle("\(donorCount) \("Donors")" , for: .normal)
                    }
                    
                    
                    
                    
            
                }
                case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
