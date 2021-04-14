//
//  ProfileVC.swift
//  ONOV
//
//  Created by anil kumar on 04/03/21.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }

}
