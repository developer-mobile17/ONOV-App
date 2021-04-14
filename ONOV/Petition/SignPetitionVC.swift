//
//  SignPetitionVC.swift
//  ONOV
//
//  Created by anil kumar on 06/04/21.
//

import UIKit
import SwiftSignatureView

class SignPetitionVC: UIViewController {
    @IBOutlet weak var signatureView: SwiftSignatureView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }

    @IBAction func actionSignPetitionClicked(_ sender: Any) {
        if signatureView.isEmpty {
            showAlert(alertMessage: "Sign petition is empty")
        }

        else {
            if let getSignatureImage = signatureView.signature {
                print(getSignatureImage)
                self.signatureView.clear()
            }
        }
    }

    // Function for clearing the content of signature view
    @IBAction func clearSignature(_ sender: UIButton) {
        // This is how the signature gets cleared
        signatureView.clear()


}
}

