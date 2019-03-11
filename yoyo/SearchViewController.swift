//
//  SearchViewController.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/5/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import UIKit
var searchValue = ""
class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBox: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var backBBtn: UIButton!
    @IBOutlet weak var belowSign: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.5,
                       delay: 1.0,
                       usingSpringWithDamping: 0.15,
                       initialSpringVelocity: 1.0,
                       animations: {
                        self.belowSign.frame.origin.y = -300
                        self.belowSign.frame.origin.y = 200
                        
        }, completion: {
            //Code to run after animating
            (value: Bool) in
        })
    }
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        searchValue = self.searchBox.text!
        performSegue(withIdentifier: "toDetailPage", sender: self)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "searchToSecond", sender: self)
    }

}
