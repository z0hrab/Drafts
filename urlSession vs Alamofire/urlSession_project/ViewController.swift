//
//  ViewController.swift
//  urlSession_project
//
//  Created by zed on 05.04.23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    
    @IBAction func addPost(_ sender: Any) {
        self.postItem()
    }
    
    var items: [Post] = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getItems()
    }
    
    
    // Sending the post
    func postItem() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = ["Content-type" : "application/json", "charset" : "UTF-8"]
        
        let post: Post = Post(userId: 111, id: 111, title: "Hello", body: "this is my post")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(post)
        } catch {
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let newPost = try JSONDecoder().decode(Post.self, from: data)
                    self.items.insert(newPost, at: 0)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
    
    // Getting array of posts
    func getItems() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.items = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
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

