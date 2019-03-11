//
//  listTableViewController.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/11/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import UIKit
var buddies = [Buddy]()
class listTableViewController: UITableViewController {
    
    var info = [String]()
    var listOfBuddies = [[String]]()
    @IBOutlet weak var goBack: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        callPersonAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadBuddies()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfBuddies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BuddyTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BuddyTableViewCell  else {
            fatalError("The dequeued cell is not an instance of BuddyTableViewCell.")
        }
        let buddy = buddies[indexPath.row]
        cell.nameLabel.text = buddy.name
        cell.imageThumbnail.image = buddy.photo
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("row: \(indexPath.row)")
//        print(listOfBuddies[indexPath.row][0].split(separator: " ")[0])
        searchValue = String(listOfBuddies[indexPath.row][0].split(separator: " ")[0])
        let alertController = UIAlertController(title: "Browsing Buddy", message: "You Selected: " + searchValue , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func callPersonAPI(){
        let urlString : String = "http://localhost:8000/people"
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            if let array = json as? [Any]{
                if (array.count) > 0 {
                    for item in array{
//                        print(item)
                        if let dictionary = item as? [String: Any]{
                            let fir = dictionary["firstname"] as? String ?? ""
                            let las = dictionary["lastname"] as? String ?? ""
                            let name = fir + " "  + las
                            let pic = dictionary["pic"] as? String ?? ""
                            self.info = [name, pic]
//                            print(self.info)
                            self.listOfBuddies.append(self.info)
                        }
                    }
                }
            }
            }.resume()
    }
    
    private func loadBuddies() {
        for item in listOfBuddies{
//            print(item[1]+"pic")
            let photo = UIImage(named: item[1]+"pic")
            guard let person = Buddy(name: item[0], photo: photo) else {
                fatalError("Unable to instantiate person1")
            }
            buddies.append(person)
        }
    }
    
    @IBAction func goBckClicked(_ sender: Any) {
        performSegue(withIdentifier: "browseTosecond", sender: self)
    }
    
}
