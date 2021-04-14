//
//  ViewController.swift
//  ONOV
//
//  Created by anil kumar on 23/02/21.
//

import UIKit
import iOSDropDown

class ViewController: UIViewController {
    @IBOutlet var txfEmail: UITextField!
    @IBOutlet var txfPassword: UITextField!
    @IBOutlet var btnChooseCategory: UIButton!
    @IBOutlet var UserCategoryDropDown: DropDown!

    override func viewDidLoad() {
        super.viewDidLoad()
        txfEmail.text = "testing101531@yopmail.com"
        txfPassword.text = "123456"
        self.LoadUserCategoryData()
    }

    @IBAction func actionChooseCategory(_ sender: Any) {
    }
    
    @IBAction func actoinForgotPassword(_ sender: Any) {
    }
    
    @IBAction func actionLogin(_ sender: Any) {

        DispatchQueue.main.async {
            ProgressHUD.show()
            self.LoginAPICalling()
        }
    }
    @IBAction func actionSignup(_ sender: Any) {
        self.goToSignUp()
    }
    func LoadUserCategoryData () {
        UserCategoryDropDown.optionArray = ["Citizen","Politician","Organizations","Entertainers","LPA"]
        // The the Closure returns Selected Index and String
        UserCategoryDropDown.didSelect{(selectedText , index ,id) in
            let selectedUser = "Selected String: \(selectedText) \n index: \(index)"
            print(selectedUser)
        }
    }
}
//MARK:- Custom Method
extension ViewController {

    func goToHome(){
        let TabbarVC = self.storyboard?.instantiateViewController(identifier: "MainTabbarVC") as! MainTabbarVC
        self.navigationController?.pushViewController(TabbarVC, animated: true)
    }

    func goToSignUp(){
        let vcSignup = self.storyboard?.instantiateViewController(identifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vcSignup, animated: true)
    }
}

extension ViewController {
    func LoginAPICalling(){
        guard let email = txfEmail.text, !email.isEmpty else{
            showAlert(alertMessage: "Please enter Email ID")
            return
        }
        guard let password =  txfPassword.text, !password.isEmpty else{
            showAlert(alertMessage: "Please Enter Password")
            return
        }

        let deviceToken = UserDefaults.standard.value(forKey: "AppDeviceToken") ?? "askldfjksdjfjkfj"
        print("Save Device token is: \(String(describing: deviceToken))")
        if UserDefaults.standard.value(forKey: "AppDeviceToekn") != nil {

        }

        let loginAPIParam = LoginModelRequest(FieldType: "email", email: email, Password: password, Role: "Citizens", deviceToken: "Hit BY Postman", deviceType: "iOS")

        APIManger.shareInstance.callingLoginAPI(loginParam: loginAPIParam) { result in
            switch result {
            case.success(let json):
                ProgressHUD.dismiss()
                let statusResponse = (json as! LoginModelResponse).status
                if statusResponse == "success" {
                    let userID =  (json as! LoginModelResponse).userInfo?.id
                    UserDefaults.standard.setValue(userID, forKey:"userIDDefaults")
                    let userInfo = (json as! LoginModelResponse).userInfo?.userRef
                    UserDefaults.standard.setValue(userInfo, forKey:"userRefDefaults")
                    self.goToHome()

                }
                case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

