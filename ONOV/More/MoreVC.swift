//
//  MoreVC.swift
//  ONOV
//
//  Created by anil kumar on 03/03/21.
//

import UIKit

struct MoreData {
    let titleMore:String
    let imgMore:String?
}

class MoreVC: UIViewController {
    var arrMore = [MoreData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpMoreCollectionData()
    }

    func setUpMoreCollectionData(){
        arrMore = [MoreData(titleMore: "Stats", imgMore: "stats"),
                   MoreData(titleMore: "Total Winning", imgMore: "TotalWinning"),
                   MoreData(titleMore: "All Winners", imgMore: "AllWinner"),
                   MoreData(titleMore: "Profile", imgMore: "Profile"),
                   MoreData(titleMore: "Create Event", imgMore: "Events"),
                   MoreData(titleMore: "Debate Requests", imgMore: "DebateRequest"),
                   MoreData(titleMore: "Petetion", imgMore: "Petetion"),
                   MoreData(titleMore: "Donation", imgMore: "Donation"),
                   MoreData(titleMore: "About App", imgMore: "AboutApp"),
                   MoreData(titleMore: "Setting", imgMore: "Settings"),
                   MoreData(titleMore: "Privacy Policy", imgMore: "Privacy"),
                   MoreData(titleMore: "Terms & Conditions", imgMore: "Terms"),
                   MoreData(titleMore: "Logout", imgMore: "Logout")
        ]
    }

    func goToMoreDetailUI() {
        let vcMoreDetail = self.storyboard?.instantiateViewController(identifier: "MoreDetailsVC") as!MoreDetailsVC
        self.navigationController?.pushViewController(vcMoreDetail, animated: true)
    }

    func goToAllWinnerUI() {
        let vcAllWinner = self.storyboard?.instantiateViewController(identifier: "AllWinnerVC") as!AllWinnerVC
        self.navigationController?.pushViewController(vcAllWinner, animated: true)
    }

    func goToProfileUI() {
        let vcProfileVC = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as!ProfileVC
        self.navigationController?.pushViewController(vcProfileVC, animated: true)
    }

    func goToDebateRequest() {
        let vcDebateRequestVC = self.storyboard?.instantiateViewController(identifier: "DebateRequestVC") as!DebateRequestVC
        self.navigationController?.pushViewController(vcDebateRequestVC, animated: true)
    }


    func goToDonationVC() {
        let vcDonationVC = self.storyboard?.instantiateViewController(identifier: "DonationVC") as!DonationVC
        self.navigationController?.pushViewController(vcDonationVC, animated: true)
    }


    func goToPetetionVC() {
        let vcPetitionListVC = self.storyboard?.instantiateViewController(identifier: "PetitionListVC") as!PetitionListVC
        self.navigationController?.pushViewController(vcPetitionListVC, animated: true)
    }
    func goToTermsConditionUI() {
        let vcMoreDetail = self.storyboard?.instantiateViewController(identifier: "Terms_ConditionVC") as!Terms_ConditionVC
        self.navigationController?.pushViewController(vcMoreDetail, animated: true)
    }


    func goTovcSettingVCUI() {
        let vcSettingVC = self.storyboard?.instantiateViewController(identifier: "SettingVC") as!SettingVC
        self.navigationController?.pushViewController(vcSettingVC, animated: true)
    }


    func goTovcLogoutVCUI() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }
    
    
    
    
     func actionCreateEventIconClicked() {
        let vcCreateEvent = self.storyboard?.instantiateViewController(identifier: "EventListingVC")as!EventListingVC
        self.navigationController?.pushViewController(vcCreateEvent, animated: true)
    }
}

extension MoreVC: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMore.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellMore = collectionView.dequeueReusableCell(withReuseIdentifier: "moreCollectionCell", for: indexPath) as! moreCollectionCell
        let MoreData = arrMore[indexPath.row]

        if let img = MoreData.imgMore {
            cellMore.imgMore.image = UIImage(imageLiteralResourceName: img )

        }

        cellMore.titleMore.text = MoreData.titleMore
        return cellMore
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170 , height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0   , left: 0, bottom: 0, right: 0)
    }
}

extension MoreVC:UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  strSelectedData = arrMore[indexPath.row].titleMore

        if strSelectedData == "Stats"{
            self.goToMoreDetailUI()

        }
        else if strSelectedData == "Total Winning" {
           // self.goToMoreDetailUI()

        }

        else if strSelectedData == "All Winners" {
            self.goToAllWinnerUI()

        }

        else if strSelectedData == "Profile" {
            self.goToProfileUI()

        }
        else if strSelectedData == "Create Event" {
            self.actionCreateEventIconClicked()

        }

        else if strSelectedData == "Debate Requests" {
            self.goToDebateRequest()

        }
        
        else if strSelectedData == "Petetion" {
            self.goToPetetionVC()

        }



        else if strSelectedData == "Donation" {
            self.goToDonationVC()

        }


        else if strSelectedData == "About App" {
            self.goToTermsConditionUI()

        }


        else if strSelectedData == "Setting" {
            self.goTovcSettingVCUI()

        }


        else if strSelectedData == "Privacy Policy" {
            self.goToTermsConditionUI()

        }


        else if strSelectedData == "Terms & Conditions" {
            self.goToTermsConditionUI()
        }

        else {
           self.goTovcLogoutVCUI()
        }
    }

}


