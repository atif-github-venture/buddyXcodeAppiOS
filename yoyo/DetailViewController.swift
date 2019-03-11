//
//  DetailViewController.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/7/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var detailPgBG: UIImageView!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var teamField: UILabel!
    @IBOutlet weak var genderField: UILabel!
    @IBOutlet weak var ageField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var addressField: UILabel!
    @IBOutlet weak var errPag: UIImageView!
    var info = [String]()
    
    override func viewDidLoad() {
        self.errPag.isHidden = true
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callSpecificPersonAPI(person: searchValue)
        print("exiting viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var send: Bool
        if (info.isEmpty){
            send = false
        }else{
            send = true
        }
        displayInfo(flag: send)
        print("exiting viewDidAppear")
    }
    
    func displayInfo(flag: Bool){
        if (flag){
            print(info[5])
            self.personImage.image = UIImage(named: info[4] + "pic")
            print("pic displayed")
            self.nameField.text = info[0]
            self.ageField.text = info[1]
            self.genderField.text = info[2]
            self.teamField.text = info[3]
            self.addressField.text = info[5]
        }else{
            self.detailPgBG.isHidden = true
            self.errPag.isHidden = false
            self.backBtn.isHidden = false
        }
    }
    
//    func callPersonAPI(){
//        let urlString : String = "http://localhost:8000/people"
//        //Implementing URLSession
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//            guard let data = data else { return }
//            print("data: ",  data)
//            print("response: ", response!)
//
//            do {
//                let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                if let array = json as? [Any] {
//                    if let firstObject = array.first {
//                        if let dictionary = firstObject as? [String: Any]{
//                            for (key, value) in dictionary {
//                                if let nestedDictionary = value as? [String: Any] {
//                                    for (k, v) in nestedDictionary {
//                                        print(k)
//                                        print(v)
//                                    }
//                                }else{
//                                    print(key)
//                                    print(value)
//                                }
//                            }
//                        }
//                    }
//                }
//            } catch let jsonError {
//                print(jsonError)
//            }
//            }.resume()
//    }
    
        func callSpecificPersonAPI(person: String){
            print("inside callSpecificPersonAPI()")
            let urlString : String = "http://localhost:8000/people/" + person
            let url = URL(string: urlString)!
            URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any]{
                if (dictionary.count) > 0 {
                    print(dictionary["firstname"])
                    let fir = dictionary["firstname"] as? String ?? ""
                    let las = dictionary["lastname"] as? String ?? ""
                    let name = fir + " "  + las
                    let age = dictionary["age"] as? String ?? ""
                    let gender = dictionary["gender"] as? String ?? ""
                    let team = dictionary["team"] as? String ?? ""
                    let pic = dictionary["pic"] as? String ?? ""
                    print("pic:", pic)
                    self.info = [name, age, gender, team, pic]
                    for (_, value) in dictionary {
                        if let nestedDictionary = value as? [String: Any] {
                            let city = nestedDictionary["city"] as? String ?? ""
                            let state = nestedDictionary["state"] as? String ?? ""
                            let address = city + ", "  + state
                            self.info.append(address)
                        }
                    }
                    print(self.info)
                }
            }
            }.resume()
    }
    

    @IBAction func bckBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "detailToSearch", sender: self)
    }

}
