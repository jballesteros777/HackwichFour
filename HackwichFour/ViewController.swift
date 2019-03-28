//
//  ViewController.swift
//  HackwichFour
//
//  Created by CM Student on 2/28/19.
//  Copyright © 2019 Jordan Ballesteros. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myFriends = ["Quake", "Zephyr", "Dawn", "Dusk"]
    
    var restaurantImageData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        restaurantImageData = dict!.object(forKey: "restaurantImages") as! [String]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let text = myFriends[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"
        {
            let s1 = segue.destination as! detailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagepass = restaurantImageData[imageIndex!]
        }
    }
    
}

