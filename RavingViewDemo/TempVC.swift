//
//  TempVC.swift
//  RavingViewDemo
//
//  Created by Ravindra Sonkar on 31/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import UIKit

class TempVC: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           let nib = nibNameOrNil ?? "TempVC"
        super.init(nibName: nib, bundle: Bundle.main )
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func tempBtnaction(_ sender: Any) {
        Utils.window()?.viewWithTag(212121)?.removeFromSuperview()
    }
   

}
