//
//  ChatViewController.swift
//  ONOV
//
//  Created by anil kumar on 03/03/21.
//

import UIKit

struct MessageData {
    let name: String
    let profileImg: String
    let lastMessage:String
    let messageTime:String
}

struct StatusData {
    let name: String
    let profileImg: String
}

class ChatViewController: UIViewController {

    var arrStatus =  [StatusData]()
    var arrMessage = [MessageData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpStatusData()
        self.setUpMessageData()
    }

    func setUpStatusData() {

        arrStatus = [StatusData(name: "Micle", profileImg: "gulf"),StatusData(name: "gulf", profileImg: "haddi"),StatusData(name: "haddi", profileImg: "josip"),StatusData(name: "Micle", profileImg: "gulf"),StatusData(name: "Micle", profileImg: "gulf"),StatusData(name: "gulf", profileImg: "haddi"),StatusData(name: "haddi", profileImg: "josip"),StatusData(name: "Micle", profileImg: "gulf")

        ]

    }
    func setUpMessageData() {
        arrMessage = [MessageData(name: "Gulf Doe", profileImg: "gulf", lastMessage: "Hi,How are you?", messageTime: "6 Tue, 3:45 pm"),
                      MessageData(name: "Haddi", profileImg: "haddi", lastMessage: "Hi,How are you?", messageTime: "6 Tue, 3:45 pm"),
                      MessageData(name: "Josip", profileImg: "josip", lastMessage: "Hi,How are you?", messageTime: "6 Tue, 3:45 pm"),
                      MessageData(name: "Dope", profileImg: "gulf", lastMessage: "Hi,How are you?", messageTime: "6 Tue, 3:45 pm"),
                      MessageData(name: "Micle", profileImg: "haddi", lastMessage: "Hi,How are you?", messageTime: "6 Tue, 3:45 pm"),
                      MessageData(name: "Arina", profileImg: "josip", lastMessage: "Hi,How are you?", messageTime: "6 Tue, 3:45 pm")
        ]

    }

    @IBAction func actionNotificationIconClicked(_ sender: Any) {
        let vcNotification = self.storyboard?.instantiateViewController(identifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vcNotification, animated: true)
    }
}


extension ChatViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrStatus.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let statusCell = collectionView.dequeueReusableCell(withReuseIdentifier: "statusCollectionCell", for: indexPath) as! statusCollectionCell

        let StatusModel = arrStatus[indexPath.row]
        statusCell.imgStatusProfile.image = UIImage(imageLiteralResourceName: StatusModel.profileImg)
        statusCell.lblStatusName.text = StatusModel.name

        return statusCell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0   , left: 0, bottom: 0, right: 0)
    }



}

extension ChatViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrMessage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatCell = tableView.dequeueReusableCell(withIdentifier: "ChatViewCell", for: indexPath) as! ChatViewCell

        let MessageModel = arrMessage[indexPath.row]
        chatCell.imgChatProfile.image = UIImage(imageLiteralResourceName: MessageModel.profileImg)
        chatCell.lblUserChatName.text = MessageModel.name
        chatCell.lblUserMessage.text = MessageModel.lastMessage
        chatCell.lblUserMessageTime.text = MessageModel.messageTime
        
        return chatCell
    }


}
