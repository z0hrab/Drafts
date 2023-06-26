//
//  ViewController.swift
//  rootController_practice
//
//  Created by zed on 13.03.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionButton(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            UserDefaults.standard.set(true, forKey: "loggedIn") // Setting the flag
            sceneDelegate.setSecondRootController(windowScene: scene)
        }
    }
}

