//
//  UserDefaults.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/28/23.
//

import Foundation

class SaveFavorites: ObservableObject {
    let saveKey = "Favorites"
    @Published var favorites: [String]
    
    init() {
        self.favorites = UserDefaults.standard.stringArray(forKey: saveKey) ?? []
    }
    
    func addFavorite(id: String) {
        favorites.append(id)
        UserDefaults.standard.set(favorites, forKey: saveKey)
        print("CardsID in saveFavorites: \(favorites)")
    }
    
    func getFavorites() -> [String] {
        //return favorites
        return UserDefaults.standard.stringArray(forKey: saveKey) ?? []
    }
    
    func removeFavorite(id: String) {
        favorites.removeAll(where: { $0 == id })
        UserDefaults.standard.set(favorites, forKey: saveKey)
        print("CardsID in saveFavorites: \(favorites)")
    }
    
    func checkIfCardIsFavorite(id: String) -> Bool {
        return favorites.contains(id)
    }
}
