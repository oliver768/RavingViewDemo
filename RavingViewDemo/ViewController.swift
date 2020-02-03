//
//  ViewController.swift
//  RavingViewDemo
//
//  Created by Ravindra Sonkar on 31/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(_ sender: Any) {
        self.showRatingPopUp(floatingType: .wholeRatings, floatingFullImage: #imageLiteral(resourceName: "icons8-star-20"), floatingEmptyImage: #imageLiteral(resourceName: "icons8-fill_star-20 "), submitBtnColor: #colorLiteral(red: 0.9411764706, green: 0.4039215686, blue: 0.5215686275, alpha: 1)) { (ratingObj) in
            print(ratingObj)
        }
    }
   
    
}

