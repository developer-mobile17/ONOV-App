//
//  IntroductionVC.swift
//  ONOV
//
//  Created by anil kumar on 11/03/21.
//

import UIKit

class IntroductionVC: UIViewController {
    @IBOutlet weak var colle:UICollectionView!
    @IBOutlet weak var btnNext:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

     var img = [String]()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.btnNext.isHidden = true
        self.btnBack.isHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        img = ["intro1","intro2"]
        self.colle.delegate = self
        self.colle.dataSource = self
        if let layout = colle.collectionViewLayout as? UICollectionViewFlowLayout {
        layout.scrollDirection = .horizontal

    }
}


}


extension IntroductionVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
            if(Int(offSet + horizontalCenter) / Int(width) == 0){
                self.btnNext.isHidden = true
                self.btnBack.isHidden = true
            }
            else{
                self.btnNext.isHidden = false
                self.btnBack.isHidden = false
            }
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:IntroCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCollectionCell", for: indexPath) as! IntroCollectionCell

        cell.imgBoard.image = UIImage(imageLiteralResourceName: img[indexPath.row])
        print(cell.imgBoard.image!)
//        if(indexPath.row == 0){
//            self.btnNext.isHidden = true
//        }
//        else{
//            self.btnNext.isHidden = false
//        }
        return cell
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 410 , height: 816)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0   , left: 0, bottom: 0, right: 0)
    }



//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.invalidateLayout()
//        let cellWidth = UIScreen.main.bounds.size.width
//              let cellHeight = UIScreen.main.bounds.size.height
//              return CGSize(width: cellWidth, height: cellHeight)
//
//       }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        let cellWidth = UIScreen.main.bounds.size.width
//        let cellHeight = UIScreen.main.bounds.size.height
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
}
class IntroCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgBoard:UIImageView!
}

