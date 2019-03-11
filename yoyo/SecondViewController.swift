//
//  SecondViewController.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/4/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var browseBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var drawerMenu: UIImageView!
    @IBOutlet weak var hamMenu: UIButton!
    @IBOutlet weak var serachIcon: UIImageView!
    var hamToggle = false
    override func viewDidLoad() {
        super.viewDidLoad()
        drawerMenu.isHidden = true
        searchBtn.isHidden = true
        browseBtn.isHidden = true
        serachIcon.isHidden = true
    }
    
    @IBAction func hamMenuClicked(_ sender: Any) {
        if(!hamToggle){
            drawerMenu.isHidden = false
            searchBtn.isHidden = false
            browseBtn.isHidden = false
            serachIcon.isHidden = false
            hamToggle = true
        }else{
            drawerMenu.isHidden = true
            searchBtn.isHidden = true
            browseBtn.isHidden = true
            serachIcon.isHidden = true
            hamToggle = false
        }
    }
    
    @IBAction func browseBtnClicked(_ sender: Any) {
        print("inside browse")
        performSegue(withIdentifier: "toBrowse", sender: self)
    }
    @IBAction func searchBtnClicked(_ sender: Any) {
        print("inside search")
        performSegue(withIdentifier: "toSearch", sender: self)
    }
    
}
