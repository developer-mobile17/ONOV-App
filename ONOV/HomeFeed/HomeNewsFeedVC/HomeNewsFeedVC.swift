//
//  HomeNewsFeedVC.swift
//  ONOV
//
//  Created by anil kumar on 05/04/21.
//

import UIKit
import Kingfisher
import PDFKit
import AVKit


class HomeNewsFeedVC: UIViewController {
    
    @IBOutlet var objTable: UITableView!
    @IBOutlet var btnNotification: UIButton!
    var arrNewsFeedData = [DataFeed]()
    private var pullControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.objTable.register(UINib(nibName: "NewsFeedTypeText", bundle: nil), forCellReuseIdentifier: "NewsFeedTypeText")
        
        self.objTable.register(UINib(nibName: "NewsFeedTypeImgeWithTextCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTypeImgeWithTextCell")
        
        self.objTable.register(UINib(nibName: "NewsFeedTypeDocumentCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTypeDocOnlyCell")
        
        self.objTable.register(UINib(nibName: "NewsFeedVideoWithtextCell", bundle: nil), forCellReuseIdentifier: "NewsFeedVideoWithtextCell")
        
        
        pullControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
                pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
                if #available(iOS 10.0, *) {
                    objTable.refreshControl = pullControl
                } else {
                    objTable.addSubview(pullControl)
                }
        
        
    }
    
    @objc private func refreshListData(_ sender: Any) {
            self.pullControl.endRefreshing() // You can stop after API Call
            // Call API
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
            self.objTable.isHidden = true
           
            self.getHomeFeedData()
            
    }
    
    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }
}




extension HomeNewsFeedVC {
    func getHomeFeedData(){
        
        DispatchQueue.global(qos: .userInteractive).async {
            ProgressHUD.show()
            let FeedDataParam = HomeFeedRequest(userRef: "c3Y1b1L6i1KvM")
            APIManger.shareInstance.callingGetHomeFeedAPI(HomeFeedParam: FeedDataParam) { [self] result in
                switch result {
                case.success(let json):
                    ProgressHUD.dismiss()
                    
                    let statusResponse = (json as! HomeFeedResponse).status
                    if statusResponse == "success" {
                        self.arrNewsFeedData = (json as! HomeFeedResponse).data!
                        DispatchQueue.main.async {
                            self.objTable.reloadData()
                            objTable.isHidden = false
                        }
                    }
                case.failure(let err):
                    print(err.localizedDescription)
                }
            }
            
        }
        
    }
}


extension HomeNewsFeedVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let HomeFeedModel = arrNewsFeedData[indexPath.row]
        
        if let FileType = HomeFeedModel.fileType {
            if FileType == "image" {
                
                print("Find Image Type here")
                let cellHomeFeedBoth = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTypeImgeWithTextCell", for: indexPath) as! NewsFeedTypeImgeWithTextCell
                
                
                //TODO:- To Get Profile Photo
                if let profilePhoto = HomeFeedModel.profilePic {
                    let profilePhotoUrl = URL(string:"\(ImageBaseURL)\(profilePhoto)")
                    cellHomeFeedBoth.userImg.kf.setImage(with: profilePhotoUrl)
                }
                
                else {
                    cellHomeFeedBoth.userImg.image = UIImage(imageLiteralResourceName: "amount")
                }
                
                
                cellHomeFeedBoth.userName?.text = HomeFeedModel.name?.capitalized
                cellHomeFeedBoth.lblPostTitle?.text = HomeFeedModel.title?.capitalized
                cellHomeFeedBoth.txtData?.text = HomeFeedModel.description
                cellHomeFeedBoth.postDataTime?.text = HomeFeedModel.created_at
                
                //TODO:- To Get Profile Photo
                if let imgData = HomeFeedModel.filePath {
                    let imgPhotoUrl = URL(string:"\(ImageBaseURL)\(imgData)")
                    cellHomeFeedBoth.imgData?.kf.setImage(with: imgPhotoUrl)
                }
                
                cellHomeFeedBoth.userImg?.cornerRadius = (cellHomeFeedBoth.userImg?.frame.size.width)!/2
                cellHomeFeedBoth.userImg?.clipsToBounds = true
                return cellHomeFeedBoth
                
            }
            
            
            else if FileType == "" {
                let cellHomeFeedText = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTypeText", for: indexPath) as! NewsFeedTypeText
                
                //TODO:- To Get Profile Photo
                if let profilePhoto = HomeFeedModel.profilePic {
                    let profilePhotoUrl = URL(string:"\(ImageBaseURL)\(profilePhoto)")
                    cellHomeFeedText.userImg.kf.setImage(with: profilePhotoUrl)
                }
                
                else {
                    cellHomeFeedText.userImg.image = UIImage(imageLiteralResourceName: "amount")
                }
                
                cellHomeFeedText.userName.text = HomeFeedModel.name?.capitalized
                cellHomeFeedText.txtData.text = HomeFeedModel.description
                cellHomeFeedText.lblPostTitle?.text = HomeFeedModel.title?.capitalized
                cellHomeFeedText.postDataTime.text = HomeFeedModel.created_at
                
                cellHomeFeedText.userImg.cornerRadius = cellHomeFeedText.userImg.frame.size.width/2
                cellHomeFeedText.userImg.clipsToBounds = true
                return cellHomeFeedText
                
            }
            
            
            else if FileType == "document" {
                let cellHomeFeedDoc = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTypeDocOnlyCell", for: indexPath) as! NewsFeedTypeDocOnlyCell
                
                //TODO:- To Get Profile Photo
                if let profilePhoto = HomeFeedModel.profilePic {
                    let profilePhotoUrl = URL(string:"\(ImageBaseURL)\(profilePhoto)")
                    cellHomeFeedDoc.userImg.kf.setImage(with: profilePhotoUrl)
                }
                
                else {
                    cellHomeFeedDoc.userImg.image = UIImage(imageLiteralResourceName: "amount")
                }
                
                cellHomeFeedDoc.userName.text = HomeFeedModel.name?.capitalized
                cellHomeFeedDoc.lblPostTitle.text = HomeFeedModel.title?.capitalized
                cellHomeFeedDoc.txtData.text = HomeFeedModel.description
                cellHomeFeedDoc.postDataTime.text = HomeFeedModel.created_at
                
                
                //TODO:- To Get Doc
                //                if let docData = HomeFeedModel.filePath {
                //                    let docUrl = URL(string:"\(ImageBaseURL)\(docData)")
                //                    cellHomeFeedDoc.docData.autoScales = true
                //                    cellHomeFeedDoc.docData.document = PDFDocument(url:docUrl!)
                //                }
                
                
                
                // pdfFileView.document = PDFDocument(url: pdfURL)
                
                
                cellHomeFeedDoc.userImg.cornerRadius = cellHomeFeedDoc.userImg.frame.size.width/2
                cellHomeFeedDoc.userImg.clipsToBounds = true
                return cellHomeFeedDoc
                
            }
            
            else
            {
                //TODO:- Video FIle
                let cellHomeFeedVidoe = tableView.dequeueReusableCell(withIdentifier: "NewsFeedVideoWithtextCell", for: indexPath) as! NewsFeedVideoWithtextCell
                
                //TODO:- To Get Profile Photo
                if let profilePhoto = HomeFeedModel.profilePic {
                    let profilePhotoUrl = URL(string:"\(ImageBaseURL)\(profilePhoto)")
                    cellHomeFeedVidoe.userImg.kf.setImage(with: profilePhotoUrl)
                }
                else {
                    cellHomeFeedVidoe.userImg.image = UIImage(imageLiteralResourceName: "amount")
                }
                cellHomeFeedVidoe.userName.text = HomeFeedModel.name?.capitalized
                cellHomeFeedVidoe.lblTitle.text = HomeFeedModel.title?.capitalized
                cellHomeFeedVidoe.txtData.text = HomeFeedModel.description
                cellHomeFeedVidoe.postDataTime.text = HomeFeedModel.created_at
                
                
                // TODO:- Get Video Path
                // cellHomeFeedVidoe.imgData.kf.indicatorType = .activity
                if let imgData = HomeFeedModel.filePath {
                    let provider = AVAssetImageDataProvider (assetURL: URL(string:"\(ImageBaseURL)\(imgData)")!, seconds: 15.0
                    )
                    KF.dataProvider(provider).set(to: cellHomeFeedVidoe.imgData)
                }
                
                
                cellHomeFeedVidoe.btnPlayVideo.tag = indexPath.row
                cellHomeFeedVidoe.btnPlayVideo .addTarget(self, action: #selector(btnPayVideoClicked), for:.touchUpInside)
                
                
                
                
                cellHomeFeedVidoe.userImg.cornerRadius = cellHomeFeedVidoe.userImg.frame.size.width/2
                cellHomeFeedVidoe.userImg.clipsToBounds = true
                return cellHomeFeedVidoe
                
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNewsFeedData.count
    }
}

extension HomeNewsFeedVC {
    @objc func btnPayVideoClicked(sender: UIButton)
    {
        if let videoPath = arrNewsFeedData[sender.tag].filePath
          {
            if let urlVideo = URL(string:"\(ImageBaseURL)\(videoPath)")
            {
                let player = AVPlayer(url: urlVideo)
                let controller = AVPlayerViewController()
                controller.player = player
                present(controller, animated: true) {
                    player.play()
                }
                
            }
            
        }
        
    }
}

extension HomeNewsFeedVC {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



