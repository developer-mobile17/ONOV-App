//
//  SignupVC.swift
//  ONOV
//
//  Created by anil kumar on 26/02/21.
//

import UIKit
import FlagPhoneNumber

class SignupVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var btnImgProfile: UIButton!
    @IBOutlet var txfname: UITextField!
    @IBOutlet var txfEmail: UITextField!
    @IBOutlet var btnCountrySelect: UIButton!
    @IBOutlet var txfPhone: FPNTextField!
    @IBOutlet var txfPassword: UITextField!
    @IBOutlet var btnChooseCategory: UIButton!

    var imagePicker = UIImagePickerController()
    var strDialCode : String!


    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupCountryFlag()
    }

    func setupCountryFlag() {

        txfPhone.displayMode = .list // .picker by default
        listController.setup(repository: txfPhone.countryRepository)
        listController.didSelect = { [weak self] country in
            self?.txfPhone.setFlag(countryCode: country.code)
        }

        txfPhone.delegate = self
        txfPhone.font = UIFont.systemFont(ofSize: 14)

        // Custom the size/edgeInsets of the flag button
        txfPhone.flagButtonSize = CGSize(width: 45, height: 45)
        txfPhone.flagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        // Example of customizing the textField input accessory view
        let items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: nil),
            UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
            UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
        ]
        txfPhone.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)
        txfPhone.setFlag(countryCode: .US)
    }

    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()

        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()

        return toolbar
    }

    @objc func dismissCountries() {
        listController.dismiss(animated: true, completion: nil)
    }


}


//MARK:- UIButton Action
extension SignupVC {
    @IBAction func actionChooseProfilePhoto(_ sender: Any) {
        self.OpenProfileCameraMenu()
    }
    @IBAction func actionChooseCategory(_ sender: Any) {
    }
    @IBAction func actionSignUp(_ sender: Any) {

        DispatchQueue.main.async {
            ProgressHUD.show()
            self.SignUpAPICalling()
        }
       // self.goToHome()
    }
    @IBAction func actionAlreadyLogin(_ sender: Any) {
        self.goToLogin()
    }


}

//MARK:- Custom Method
extension SignupVC {

    func goToHome(){
        let TabbarVC = self.storyboard?.instantiateViewController(identifier: "MainTabbarVC") as! MainTabbarVC
        self.navigationController?.pushViewController(TabbarVC, animated: true)
    }

    func goToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:-  Select Flag Custom Method
extension SignupVC: FPNTextFieldDelegate {

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))

        print(
            isValid,
            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
            textField.getRawPhoneNumber() ?? "Raw: nil"
        )
    }

    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        strDialCode = dialCode
        print(strDialCode!)

    }


    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)

        listController.title = "Select Country"
        listController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries))

        self.present(navigationViewController, animated: true, completion: nil)
    }
}


//MARK:- Helper Method

extension SignupVC {

    func OpenProfileCameraMenu()  {


        let alertController = UIAlertController(title: nil, message: "Select Photos ", preferredStyle: .actionSheet)

        let action1 = UIAlertAction(title: "Open Camera", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            print("Open Camera")
            self.OpenCamera()
        })

        let action2 = UIAlertAction(title: "Open Gallery", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            print("Open Gallery")
            self.OpenGallery()
        })


        let maybeAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
            print("Cancel")
        })



       // UIImage(imageLiteralResourceName:"NoImg.png")

        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(maybeAction)

        self.present(alertController, animated: true, completion: nil)

    }
}


//MARK:- UIImagePicker Methods
extension SignupVC {
    func OpenCamera(){

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){

            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            print("No Camera Found...!")
        }

    }


    func OpenGallery(){
        UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)


    }

    //MARK: — ImagePicker delegate
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImg = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
            //save image ?? Display Image
            btnImgProfile.layer.cornerRadius = btnImgProfile.frame.size.height/2
            btnImgProfile.clipsToBounds = true
            btnImgProfile .setImage(selectedImg, for: .normal)
          //  btnImgProfile.image = selectedImg

        }
        self.dismiss(animated: true, completion: nil)
    }

}


extension SignupVC {

    func SignUpAPICalling(){


        guard let name = txfname.text, !name.isEmpty else{
            showAlert(alertMessage: "Please enter Name")
            return
        }

        guard let email = txfEmail.text, !email.isEmpty else{
            showAlert(alertMessage: "Please enter Email ID")
            return
        }
        guard let password =  txfPassword.text, !password.isEmpty else{
            showAlert(alertMessage: "Please Enter Password")
            return
        }

        guard let phone =  txfPhone.text, !phone.isEmpty else{
            showAlert(alertMessage: "Please Enter Password")
            return
        }


        let deviceToken = UserDefaults.standard.value(forKey: "AppDeviceToken") ?? "askldfjksdjfjkfj"
        print("Save Device token is: \(String(describing: deviceToken))")
        if UserDefaults.standard.value(forKey: "AppDeviceToekn") != nil {

        }

        let userRegisterParam = signUpRequest(fullName: name, email: email, countryCode: strDialCode!, phone: phone, password: password, role: "Citizens", deviceToken: deviceToken as! String, deviceType: "iOS", profilePic: "")

        APIManger.shareInstance.callingSignUpAPI(signUpParam:userRegisterParam) { result in
            switch result {
            case.success(let json):
                ProgressHUD.dismiss()
                let statusResponse = (json as! signUpResponse).status
                if statusResponse == "success" {
                    let msg =  (json as! signUpResponse).msg
                    print(msg!)

                    Alert.present(title: "ONOV", message: msg!, actions: .ok(handler: {
                        print("Ok Button Pressed")
                    }), from: self)



//                    UserDefaults.standard.setValue(userID, forKey:"userIDDefaults")
//                    let userInfo = (json as! LoginModelResponse).userInfo?.userRef
//                    UserDefaults.standard.setValue(userInfo, forKey:"userRefDefaults")
//                    self.goToHome()

                }

                else {
                    let errMsg =  (json as! signUpResponse).msg
                    print(errMsg!)

                }
                case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}
