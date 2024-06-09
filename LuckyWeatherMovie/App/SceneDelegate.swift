//
//  SceneDelegate.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let firstVC = LottoViewController()
        let secondVC = WeatherViewController()
        let thirdVC = BoxOfficeViewController()
        [firstVC, secondVC, thirdVC].forEach { $0.view.backgroundColor = .white }
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstVC, secondVC, thirdVC], animated: true)
                tabBarController.tabBar.tintColor = UIColor(named: "keyColor")
                tabBarController.tabBar.backgroundColor = #colorLiteral(red: 0.9086325765, green: 0.971329987, blue: 0.9803524613, alpha: 1)
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "45.circle.fill")
            items[0].image = UIImage(systemName: "45.circle")
            items[0].title = "Lotto"
            
            items[1].selectedImage = UIImage(systemName: "cloud.sun.fill")
            items[1].image = UIImage(systemName: "cloud.sun")
            items[1].title = "Weather"
            
            items[2].selectedImage = UIImage(systemName: "movieclapper.fill")
            items[2].image = UIImage(systemName: "movieclapper")
            items[2].title = "BoxOffice"
        }
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }
}
