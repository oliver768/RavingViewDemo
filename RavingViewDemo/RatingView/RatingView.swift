//
//  RatingView.swift
//  BubbleAnimation
//
//  Created by Ravindra Sonkar on 31/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import UIKit
typealias submitAction = (_ ratinModel : RatingModal) -> Void

class RatingView: UIViewController {
    @IBOutlet weak var submitBtnOutlet: UIButton!
    @IBOutlet weak var floatingView: FloatRatingView!
    @IBOutlet weak var headerMsgLbl: UILabel!
    @IBOutlet weak var showAgainBtnOutlet: UIButton!
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    @IBOutlet weak var dontShowBtnHgtCons : NSLayoutConstraint!
    
    var ratingObj = RatingModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingView.backgroundColor = .clear
        floatingView.type = ratingObj.floatingType
        floatingView.rating = 1
        submitBtnOutlet.backgroundColor = ratingObj.submitBtnColor
        floatingView.emptyImage = ratingObj.floatingEmptyImage
        floatingView.fullImage = ratingObj.floatingFullImage
        floatingView.contentMode = .scaleAspectFit
        dontShowBtnHgtCons.constant = ratingObj.isDontShowMsgHidden! ? 0 : 30
        showAgainBtnOutlet.isHidden = dontShowBtnHgtCons.constant == 0
        headerMsgLbl.text = ratingObj.headerMsg
        showAgainBtnOutlet.setImage(ratingObj.isShowAgain ? UIImage(named: "dark_circle-50") : UIImage(named: "circle50"), for: .normal)

    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        ratingObj.ratingVal = floatingView.rating
        ratingObj.submitBtnClosure!(ratingObj)
        closePopUp()
        
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        closePopUp()
    }
    
    @IBAction func showAgainBtnAction(_ sender: UIButton) {
        ratingObj.isShowAgain = !ratingObj.isShowAgain
        showAgainBtnOutlet.setImage(ratingObj.isShowAgain ? UIImage(named: "dark_circle-50") : UIImage(named: "circle50"), for: .normal) 
    }
    
    func closePopUp() {
        Utils.window()?.viewWithTag(212121)?.removeFromSuperview()
    }
}

class Utils {
    static func window() -> UIWindow? {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) else{
                return nil
            }
            return sd.window
        } else {
            return UIApplication.shared.delegate?.window ?? nil
        }
    }
}

extension UIViewController {
    // MARK:- This will open a rating PopUp.
    ///FloatRatingViewType :- Whole(Interger)/ HalfRatings(Double rating in increments of 0.5)/ FloatRatings(Double rating)

    func showRatingPopUp(_ headerMsg : String? = nil, floatingType : FloatRatingViewType, floatingFullImage : UIImage, floatingEmptyImage : UIImage, isDontShowMsgHidden : Bool? = nil,  submitBtnColor : UIColor, submitBtnClosure : @escaping submitAction) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: Utils.window()?.bounds.width ?? UIScreen.main.bounds.width, height: Utils.window()?.bounds.height ?? UIScreen.main.bounds.height))
        mainView.backgroundColor = .clear
        mainView.tag = 212121
        let ratingModal = RatingModal()
        ratingModal.headerMsg = headerMsg ?? "Did you like this recipe? \n Rate it now"
        ratingModal.floatingType = floatingType
        ratingModal.isDontShowMsgHidden = isDontShowMsgHidden ?? false
        ratingModal.floatingEmptyImage = floatingEmptyImage
        ratingModal.floatingFullImage = floatingFullImage
        ratingModal.submitBtnColor = submitBtnColor
        ratingModal.submitBtnClosure = submitBtnClosure
        let ratingView = RatingView()
        ratingView.ratingObj = ratingModal
        ratingView.view.center = mainView.center
        mainView.addSubview(ratingView.view)
        self.addChild(ratingView)
        self.view.addSubview(mainView)
        ratingView.view.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [],  animations: {
            ratingView.view.transform = .identity
        })
    }
}
