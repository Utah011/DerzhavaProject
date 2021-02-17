//
//  SceneDelegate.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 02.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        reloadApp()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func reloadApp(){
        
        let item1 = UITabBarItem()
        let item2 = UITabBarItem()
        let item3 = UITabBarItem()
        let tabBarController = UITabBarController()

        item1.image = UIImage(named: "newsicon")
        item1.title = "Новости"
        item2.image = UIImage(named: "debateicon")
        item2.title = "Дебаты"
        item3.image = UIImage(named: "flowicon")
        item3.title = "Поток"

                
        let mainScreen = NewsViewController()
        let mainScreenNavigationController = UINavigationController(rootViewController: mainScreen)
        mainScreen.tabBarItem = item1
        
        let debateScreen = DebateViewController()
        let debatecreenNavigationController = UINavigationController(rootViewController: debateScreen)
        debateScreen.tabBarItem = item2
                
        let flowScreen = FlowViewController()
        let flowScreenNavigationController = UINavigationController(rootViewController: flowScreen)
        flowScreen.tabBarItem = item3
                
        tabBarController.tabBar.isTranslucent = false
        tabBarController.viewControllers = [mainScreenNavigationController, debatecreenNavigationController, flowScreenNavigationController]
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            window?.rootViewController = tabBarController
            print("YOU ARE IN!")
        } else {
            window?.rootViewController = tabBarController
        }
        window?.makeKeyAndVisible()
    }


}

