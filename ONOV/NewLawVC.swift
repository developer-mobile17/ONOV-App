//
//  NewLawVC.swift
//  ONOV
//
//  Created by anil kumar on 07/04/21.
//

import UIKit
import PDFKit

class NewLawVC: UIViewController, UIDocumentPickerDelegate {
    @IBOutlet var txfEnterTitle: UITextField!
    @IBOutlet var txvDesc: UITextView!

    @IBOutlet var btnPdfFileName: UIButton!
    var pdfURL: URL!
    var pdfFileName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func actionBack(_ sender: Any) {
    }
    @IBAction func createPost(_ sender: Any) {
    }
    @IBAction func actionViewPdfFile(_ sender: Any) {
        let vcViewPDF = self.storyboard?.instantiateViewController(identifier: "ViewUploadedPdfVC") as! ViewUploadedPdfVC
        vcViewPDF.pdfFileName = pdfFileName
        vcViewPDF.pdfURL = pdfURL

        self.navigationController?.pushViewController(vcViewPDF, animated: true)
    }
    @IBAction func actionUploadPDF(_ sender: Any) {


        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text", "com.apple.iwork.pages.pages", "public.data"], in: .import)

            documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)


    }

}

extension NewLawVC{
      func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {

                let cico = url as URL
                print(cico)
                print(url)

                print(url.lastPathComponent)

                print(url.pathExtension)
            pdfURL = url
            pdfFileName = url.lastPathComponent
            btnPdfFileName.setTitle(pdfFileName, for: .normal)

         // pdfView.document = PDFDocument(url: url)

               }
   }


//extension NewLawVC{
//
//    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//        guard let documentURL = urls.first else {
//               return
//        }
//
//    }
//}
