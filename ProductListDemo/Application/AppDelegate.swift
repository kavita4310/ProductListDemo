//
//  AppDelegate.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
               
               let signInConfig = GIDConfiguration(clientID: "376756479177-2l94fhj83crdhk9ha3p78su3obq7dpu9.apps.googleusercontent.com")
               GIDSignIn.sharedInstance.configuration = signInConfig
               
               GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                   if let error = error {
                       print("Error restoring previous sign-in: \(error.localizedDescription)")
                       DispatchQueue.main.async {
                           self.showInitialViewController()
                       }
                   } else if let user = user {
                       print("User is signed in: \(user.profile?.email ?? "No Email")")
                       DispatchQueue.main.async {
                           self.navigateToHomeScreen()
                       }
                   } else {
                       print("No previous user sign-in found")
                       DispatchQueue.main.async {
                           self.showInitialViewController()
                       }
                   }
               }

        return true
    }
    
    func navigateToHomeScreen() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC")
           self.window?.rootViewController = homeVC
           self.window?.makeKeyAndVisible()
       }

       func showInitialViewController() {
           print("Showing Initial View Controller")
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let initialVC = storyboard.instantiateViewController(withIdentifier: "InitialVC")
           self.window?.rootViewController = initialVC
           self.window?.makeKeyAndVisible()
       }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
