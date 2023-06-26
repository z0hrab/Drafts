//
//  SecondController.swift
//  urlSession_project
//
//  Created by zed on 05.04.23.
//

import UIKit
import Alamofire

class SecondController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var items: [Post] = [Post]()
    var item: Post = Post()
    var url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getItemsDecodable()
        
//        NetworkManager.request { data, errorMessage in
//            if let errorMessage = errorMessage {
//                print(errorMessage)
//            }
//        }
        
        
    }
    
    func getItems() {
        AF.request(url).response { object in
            if object.response?.statusCode == 200 {
                if let data = object.data {
                    do {
                        self.items = try JSONDecoder().decode([Post].self, from: data)
                        self.table.reloadData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func getItemsDecodable() {
        AF.request(url).responseDecodable(of: [Post].self) { object in
            
            switch object.result {
                case .success(let items):
                    self.items = items
                    // print(items[0].title)
                    self.table.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.items[indexPath.row].title
        return cell
    }
    
    
    
}
