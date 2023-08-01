//
//  FavoritesViewModel.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/31/23.
//
import Combine
import Foundation
import SwiftUI

extension FavoritesView {
    
    @MainActor class ViewModel: ObservableObject {
        var saveF = SaveFavorites()
        @ObservedObject var saveFavorites: SaveFavorites = SaveFavorites()
        @ObservedObject var requests = Requests()
        @Published var favoritesList: [String] = []
        @Published var favoriteCards: [Card] = []
        var subscriptions = Set<AnyCancellable>()
        
        init() {
            self.favoritesList = saveFavorites.getFavorites()
            //self.favoritesList = UserDefaults.standard.stringArray(forKey: "Favorites")!
            print("Cards in viewModel: \(favoritesList)")
            getFavoritesCard(list: favoritesList)
            
            requests.$favoritesArray
                .receive(on: DispatchQueue.main)
                .sink { [weak self] newResults in
                    self?.manuallyUpdate(newResults)
                    print("sink")
                }
                .store(in: &subscriptions)
        }
        
        func manuallyUpdate(_ newResults: [Card]) {
            favoriteCards = newResults
        }
        
        func getfavoritesList() {
            self.favoritesList = saveF.getFavorites()
        }
        
        func getFavoritesCard(list: [String]) {
            //requests.loadFavorites(favoritesId: list)
            self.favoriteCards = requests.getFavoriteCards(listId: list)
        }
    }
    
}
