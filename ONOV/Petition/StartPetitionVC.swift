//
//  StartPetitionVC.swift
//  ONOV
//
//  Created by anil kumar on 25/03/21.
//

import UIKit

class StartPetitionVC: UIViewController {

    @IBOutlet var txfAmount: UITextField!
    @IBOutlet var txfDate: UITextField!
    @IBOutlet var txfSentFrom: UITextField!
    @IBOutlet var txvDescription:UITextView!

    var datePicker: UIDatePicker?
    var datePickerConstraints = [NSLayoutConstraint]()


    override func viewDidLoad() {
        super.viewDidLoad()



        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        showDatePicker()
    }
    
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }
    
    @IBAction func actionOpenCalender(_ sender: Any) {
        datePickerConstraints.removeAll()
    }

    @IBAction func actionStartPetition(_ sender: Any) {
        DispatchQueue.main.async {
            ProgressHUD.show()
            self.AddPetitionAPI()
        }
    }


    func showDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.date = Date()
        datePicker?.locale = .current
        datePicker?.datePickerMode = .date
        datePicker?.tintColor = UIColor.black
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .compact
        } else {
            // Fallback on earlier versions
        }
        datePicker?.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
        addDatePickerAsSubview()
    }


    func addDatePickerAsSubview() {
        guard let datePicker = datePicker else { return }
        self.txfDate.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        //updateDatePickerConstraints()
    }


//    func updateDatePickerConstraints() {
//        guard let datePicker = datePicker else { return }
//
//        // Remove any previously set constraints.
//        self.view.removeConstraints(datePickerConstraints)
//        datePickerConstraints.removeAll()
//
//        // Set new constraints depending on the date picker style.
//        datePickerConstraints.append(datePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor))
//
//        if datePicker.preferredDatePickerStyle != .inline {
//            datePickerConstraints.append(datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
//        } else {
//            datePickerConstraints.append(datePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8))
//            datePickerConstraints.append(datePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8))
//        }
//
//        // Activate all constraints.
//        NSLayoutConstraint.activate(datePickerConstraints)
//    }


    @objc func handleDateSelection() {
        guard let picker = datePicker else { return }
        print("Selected date/time:", picker.date)

        let theFormatter = DateFormatter()
        theFormatter.dateStyle = .medium
        let theString = theFormatter.string(from: picker.date)
        print(theString)
        self.txfAmount.text = theString

    }
}

extension StartPetitionVC {
    func AddPetitionAPI(){
        guard let user = txfSentFrom.text, !user.isEmpty else{
            showAlert(alertMessage: "Please enter sent from name")
            return
        }
        guard let date =  txfDate.text, !date.isEmpty else{
            showAlert(alertMessage: "Please Enter date")
            return
        }

        guard let amount =  txfAmount.text, !amount.isEmpty else{
            showAlert(alertMessage: "Please Enter amount")
            return
        }

        guard let description =  txvDescription.text, !description.isEmpty else{
            showAlert(alertMessage: "Please Enter Description")
            return
        }

        let userID = UserDefaults.standard.value(forKey: "userIDDefaults") ?? "No User ID"

        let addPetitonParam = AddPetitionRequest(userId: userID as! String, amount: amount, petitionDate: date, discription: description)

        APIManger.shareInstance.callingAddPetitionAPI(AddPetitionParam: addPetitonParam) { result in
            switch result {
            case.success(let json):
                ProgressHUD.dismiss()
                let statusResponse = (json as! AddPetitionResponse).status
                if statusResponse == "success" {
                    let msg = (json as! AddPetitionResponse).msg
                    Alert.present(title: "OnOV", message: msg!, actions: .ok(handler: {
                        print("Ok Button Pressed")
                        self.navigationController?.popViewController(animated: true)
                    }), from: self)


                }
                case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
