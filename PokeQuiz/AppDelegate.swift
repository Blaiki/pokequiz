//
//  AppDelegate.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.

import UIKit
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var firstScreen:Bool = true
    let loader:AppLoader = AppLoader()
    
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController: ViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainMenu") as! ViewController
        let firstViewController: ChooseViewController = mainStoryboard.instantiateViewController(withIdentifier: "firstStart") as! ChooseViewController
        // here
        if let values:AppValues = loader.loadTeam() {
            firstScreen=false
            ViewController.teamName = values.team
        }
        if(firstScreen){
            self.window?.rootViewController = firstViewController
            let bundlePath = Bundle.main.path(forResource: "pokeQuiz", ofType: ".sqlite")
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
            let fileManager = FileManager.default
            let fullDestPath = NSURL(fileURLWithPath: path).appendingPathComponent("pokeQuiz.sqlite")
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPath!.path)
            }catch{
                print("\n")
                print(error)
            }
        }else{
            self.window?.rootViewController = mainViewController
        }
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

