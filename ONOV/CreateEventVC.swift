//
//  CreateEventVC.swift
//  ONOV
//
//  Created by wbmb on 13/04/21.
//

import UIKit

class CreateEventVC: UIViewController {

    @IBOutlet weak var txfEventTitle: UITextField!
    @IBOutlet weak var txfEventPrice: UITextField!
    @IBOutlet weak var txvDescription: UITextView!
    @IBOutlet weak var btnUploadPhoto: UIButton!
    @IBOutlet weak var btnUploadVideo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionStartDate(_ sender: Any) {
    }
    @IBAction func actionEndDate(_ sender: Any) {
    }
    @IBAction func actionStartTime(_ sender: Any) {
    }
    @IBAction func actionEndTime(_ sender: Any) {
    }
    @IBAction func actionUploadPhoto(_ sender: Any) {
    }
    @IBAction func actionUploadVideo(_ sender: Any) {
    }
}

extension CreateEventVC {
    
}
