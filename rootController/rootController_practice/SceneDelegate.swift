//
//  SceneDelegate.swift
//  rootController_practice
//
//  Created by zed on 13.03.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            self.setSecondRootController(windowScene: windowScene)
        } else {
            self.setLoginRootController(windowScene: windowScene)
        }
    }
    
    
    func setLoginRootController(windowScene: UIWindowScene) {
        if self.window == nil {
            self.window = UIWindow(windowScene: windowScene)
        }
        
        self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginNav") as! UINavigationController
        self.window?.makeKeyAndVisible()
    }
    
    func setSecondRootController(windowScene: UIWindowScene) {
        if self.window == nil {
            self.window = UIWindow(windowScene: windowScene)
        }
        
        self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondNav") as! UINavigationController
        self.window?.makeKeyAndVisible()
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}

