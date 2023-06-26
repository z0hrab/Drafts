//
//  ViewController.swift
//  test
//
//  Created by zed on 02.04.23.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UITextField!
    
    var drinkList: [String] = ["Cola","Pepsi","Sprite","Merinda"]
    var drinkListCopy: [String] = ["Cola","Pepsi","Sprite","Merinda"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.drinkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = drinkList[indexPath.row]
        return cell!
    }

    @IBAction func textFieldTyping(_ sender: Any) {
        // print("--\(self.searchBar.text)--")
        if (searchBar.text?.isEmpty ?? true) {
            drinkList = drinkListCopy
            table.reloadData()
        } else {
            let text = (searchBar.text ?? "").lowercased()
            drinkList = drinkListCopy.filter({ $0.lowercased().contains(text) })
            table.reloadData()
        }
    }
    
}
