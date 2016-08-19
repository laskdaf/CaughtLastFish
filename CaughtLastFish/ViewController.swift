//
//  ViewController.swift
//  CaughtLastFish
//
//  Created by zhenghui xie on 7/11/16.
//  Copyright © 2016 edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteButton: UIButton!
    
    @IBOutlet weak var fishButton: UIButton!
    
    @IBOutlet weak var memorizeButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        noteButton.layer.cornerRadius = 8;
        noteButton.layer.masksToBounds = true;
        //Setting rounded boarder
        noteButton.layer.borderWidth = 1
        
        fishButton.layer.cornerRadius = 8;
        fishButton.layer.masksToBounds = true;
        //Setting rounded boarder
        fishButton.layer.borderWidth = 1
        
//        memorizeButton.layer.cornerRadius = 8;
//        memorizeButton.layer.masksToBounds = true;
//        //Setting rounded boarder
//        memorizeButton.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

