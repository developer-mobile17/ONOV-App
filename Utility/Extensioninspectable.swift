//
//  Extensioninspectable.swift
//  KickTradersApp
//
//  Created by anil kumar on 15/10/20.
//  Copyright © 2020 VikasSIngh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignalbeImage: UIImageView {
    
}

@IBDesignable
class DesignalbetextField: UITextField {
    
}




extension UIView {
    
  
  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }
  
  @IBInspectable
  var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable
  var borderColor: UIColor? {
    get {
      if let color = layer.borderColor {
        return UIColor(cgColor: color)
      }
      return nil
    }
    set {
      if let color = newValue {
        layer.borderColor = color.cgColor
      } else {
        layer.borderColor = nil
      }
    }
  }
  
  @IBInspectable
  var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }
  
  @IBInspectable
  var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }
  
  @IBInspectable
  var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }
  
  @IBInspectable
  var shadowColor: UIColor? {
    get {
      if let color = layer.shadowColor {
        return UIColor(cgColor: color)
      }
      return nil
    }
    set {
      if let color = newValue {
        layer.shadowColor = color.cgColor
      } else {
        layer.shadowColor = nil
      }
    }
  }
}



@IBDesignable class SHCircleBar: UITabBar {
    var tabWidth: CGFloat = 0
    var index: CGFloat = 0 {
        willSet{
            self.previousIndex = index
        }
    }
    private var animated = false
    private var selectedImage: UIImage?
    private var previousIndex: CGFloat = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
        
    }
    override func draw(_ rect: CGRect) {
        let fillColor: UIColor = .white
        tabWidth = self.bounds.width / CGFloat(self.items!.count)
        let bezPath = drawPath(for: index)
        
        bezPath.close()
        fillColor.setFill()
        bezPath.fill()
        let mask = CAShapeLayer()
        mask.fillRule = .evenOdd
        mask.fillColor = UIColor.white.cgColor
        mask.path = bezPath.cgPath
        if (self.animated) {
            let bezAnimation = CABasicAnimation(keyPath: "path")
            let bezPathFrom = drawPath(for: previousIndex)
            bezAnimation.toValue = bezPath.cgPath
            bezAnimation.fromValue = bezPathFrom.cgPath
            bezAnimation.duration = 0.3
            bezAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            mask.add(bezAnimation, forKey: nil)
        }
        self.layer.mask = mask

    }
    
    func select(itemAt: Int, animated: Bool) {
        self.index = CGFloat(itemAt)
        self.animated = animated
        self.selectedImage = self.selectedItem?.selectedImage
        self.selectedItem?.selectedImage = nil
        self.setNeedsDisplay()
    }
    
    func customInit(){
        self.tintColor = .white
        self.barTintColor = .white
        self.backgroundColor = .white
    }
    private func drawPath(for index: CGFloat) -> UIBezierPath {
        let bezPath = UIBezierPath()

        let firstPoint = CGPoint(x: (index * tabWidth) - 25, y: 0)
        let firstPointFirstCurve = CGPoint(x: ((tabWidth * index) + tabWidth / 4), y: 0)
        let firstPointSecondCurve = CGPoint(x: ((index * tabWidth) - 25) + tabWidth / 8, y: 52)

        let middlePoint = CGPoint(x: (tabWidth * index) + tabWidth / 2, y: 55)
        let middlePointFirstCurve = CGPoint(x: (((tabWidth * index) + tabWidth) - tabWidth / 8) + 25, y: 52)
        let middlePointSecondCurve = CGPoint(x: (((tabWidth * index) + tabWidth) - tabWidth / 4), y: 0)

        let lastPoint = CGPoint(x: (tabWidth * index) + tabWidth + 25, y: 0)
        bezPath.move(to: firstPoint)
        bezPath.addCurve(to: middlePoint, controlPoint1: firstPointFirstCurve, controlPoint2: firstPointSecondCurve)
        bezPath.addCurve(to: lastPoint, controlPoint1: middlePointFirstCurve, controlPoint2: middlePointSecondCurve)
        bezPath.append(UIBezierPath(rect: self.bounds))
        return bezPath
    }
    

}


//MARK: SHOW ALERT
extension UIViewController {
    func showAlert(alertMessage : String) {
        let alert = UIAlertController(title: "ONOV App", message: alertMessage, preferredStyle: UIAlertController.Style.alert)
       // alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //Add more actions as you see fit

        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}





struct Alert {
    static func present(title: String?, message: String, actions: Alert.Action..., from controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action.alertAction)
        }
        controller.present(alertController, animated: true, completion: nil)
    }
}

extension Alert {
    enum Action {
        case ok(handler: (() -> Void)?)
        case retry(handler: (() -> Void)?)
        case close

        // Returns the title of our action button
        private var title: String {
            switch self {
            case .ok:
                return "OK"
            case .retry:
                return "Retry"
            case .close:
                return "Close"
            }
        }

        // Returns the completion handler of our button
        private var handler: (() -> Void)? {
            switch self {
            case .ok(let handler):
                return handler
            case .retry(let handler):
                return handler
            case .close:
                return nil
            }
        }

        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }
}



// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
