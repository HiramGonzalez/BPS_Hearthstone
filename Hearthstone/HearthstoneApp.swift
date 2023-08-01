//
//  HearthstoneApp.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/19/23.
//

import SwiftUI

@main
struct HearthstoneApp: App {
    var saveFavorites = SaveFavorites()
    
    var body: some Scene {
        WindowGroup {
            NavigationTabView()
                .environmentObject(saveFavorites)
        }
    }
}
