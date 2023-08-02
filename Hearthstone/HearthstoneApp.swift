//
//  HearthstoneApp.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/19/23.
//
import GooglePlaces
import SwiftUI

@main
struct HearthstoneApp: App {
    var saveFavorites = SaveFavorites()
    
    init() {
        GMSPlacesClient.provideAPIKey("AIzaSyCieTBF_KFuGwSUwrNuNfB8GEJ-6KvGYR4")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationTabView()
                .environmentObject(saveFavorites)
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        GMSPlacesClient.provideAPIKey("AIzaSyCieTBF_KFuGwSUwrNuNfB8GEJ-6KvGYR4")
//        return true
//    }
//}
