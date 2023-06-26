//
//  SecondViewController.swift
//  rootController_practice
//
//  Created by zed on 13.03.23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            UserDefaults.standard.set(false, forKey: "loggedIn") // Setting the flag
            sceneDelegate.setLoginRootController(windowScene: scene)
        }
    }
}
