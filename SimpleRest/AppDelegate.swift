//
//  AppDelegate.swift
//  SimpleRest
//
//  Created by extdev on 08.07.2021.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  
  static var shared: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  var window: UIWindow?
  
  let container: Container = {
    let container = Container()
    
    container.register(ApiService.self) {_ in
      ApiService()
    }
    container.register(RMListRepositor.self) { r in
      RMListRepositor(api: r.resolve(ApiService.self)!)
    }
    container.register(CharactersVM.self) { r in
      CharactersVM(repository: r.resolve(RMListRepositor.self)!)
    }
    container.register(CharactersVC.self) { r in
      let vc = CharactersVC()
      vc.vm = r.resolve(CharactersVM.self)!
      return vc
    }
    return container
  }()
  
  var navController: UINavigationController = UINavigationController()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let rootVC = container.resolve(CharactersVC.self)!
    navController = UINavigationController(rootViewController: rootVC)
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navController
    window?.backgroundColor = .yellow
    window?.makeKeyAndVisible()
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

