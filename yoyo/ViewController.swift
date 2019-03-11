//
//  ViewController.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/4/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var goBtn: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url  = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
    }


    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        goBtn.isHidden = true
        player.play()
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 250, width: 414, height: 243)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
            self.goBtn.isHidden = false
        }
    }
    
    @IBAction func goBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toMainPage", sender: self)
    }
    
    
}

