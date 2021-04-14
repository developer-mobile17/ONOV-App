//
//  EventListingDetailsVC.swift
//  ONOV
//
//  Created by anil kumar on 09/04/21.
//

import UIKit

class EventListingDetailsVC: UIViewController {

    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var imgEventPoster: UIImageView!
    @IBOutlet var txvEventDescription: UITextView!
    @IBOutlet var lblEventStart: UILabel!
    @IBOutlet var lblEventEnd: UILabel!
    @IBOutlet var lblEventPrice: UILabel!
    @IBOutlet var lblEventPassQuantity: UILabel!
    @IBOutlet var btnPassQuantity: [UIButton]!

    var StepperValue:Int = 1
    var eventPassPrice: Int = 25
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }


    @IBAction func actionPassQuantityPressed(_ sender: UIButton)
    {
        btnPassQuantity.forEach{
            $0.isSelected = false
        }
        sender.isSelected.toggle()
        print(sender.tag)
        switch sender.tag {
        case 1:
            subtractionCalled()
        case 2:
            AdditionCalled()

        default:
            print("😢😢😢🐣")  // contrl + command + space
        }
    }
    @IBAction func actionProceedToPay(_ sender: Any)
    {


    }

    func subtractionCalled() {
        print("👎🏼")
        if StepperValue == 1{
           // StepperValue = StepperValue - 1
            lblEventPassQuantity.text = String(StepperValue)
            lblEventPrice.text = "\("$") \(String(eventPassPrice * StepperValue))"

        } else {
            StepperValue = StepperValue - 1
            lblEventPassQuantity.text = String(StepperValue)
            lblEventPrice.text = "\("$") \(String(eventPassPrice * StepperValue))"

        }


    }

    func AdditionCalled() {
        print("👍🏼")
        StepperValue = StepperValue + 1
        lblEventPassQuantity.text = String(StepperValue)
        lblEventPrice.text = "\("$") \(String(eventPassPrice * StepperValue))"


    }
}
