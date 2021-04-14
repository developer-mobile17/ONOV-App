//
//  ViewUploadedPdfVC.swift
//  ONOV
//
//  Created by anil kumar on 07/04/21.
//

import UIKit
import PDFKit

class ViewUploadedPdfVC: UIViewController {
    @IBOutlet var lblPdfName: UILabel!
    @IBOutlet var pdfFileView: PDFView!
    var pdfFileName:String!
    var pdfURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblPdfName.text = pdfFileName
        pdfFileView.autoScales = true
        pdfFileView.document = PDFDocument(url: pdfURL)

    }


    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
