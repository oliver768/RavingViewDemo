//
//  RatingModal.swift
//  BubbleAnimation
//
//  Created by Ravindra Sonkar on 31/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import UIKit

class RatingModal: NSObject {
    var floatingType : FloatRatingViewType!
    var headerMsg = ""
    var ratingVal = 0.0
    var isShowAgain = false
    var floatingFullImage : UIImage!
    var floatingEmptyImage : UIImage!
    var isDontShowMsgHidden : Bool?
    var submitBtnColor : UIColor!
    var submitBtnClosure : submitAction?
}
