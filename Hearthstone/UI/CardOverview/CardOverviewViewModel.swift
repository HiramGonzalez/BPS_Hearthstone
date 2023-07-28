//
//  CardOverviewViewModel.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/28/23.
//

import Foundation

extension CardOverviewView {
    
    class ViewModel: ObservableObject {
        var id: String
        var saveInMemory = SaveFavorites()
        @Published var isCardFavorite: Bool
        
        init(id: String, saveInMemory: SaveFavorites = SaveFavorites()) {
            self.id = id
            self.isCardFavorite = saveInMemory.checkIfCardIsFavorite(id: id)
        }
        
        func addFavorite(id: String) {
            saveInMemory.addFavorite(id: id)
        }
        
        func removeFavorite(id: String) {
            saveInMemory.removeFavorite(id: id)
        }
        
//        func isThisCardFavorite(id: String) {
//            self.isCardFavorite = saveInMemory.checkIfCardIsFavorite(id: id)
//        }
        
        func addOrRemoveCard(id: String) {
            if isCardFavorite {
                removeFavorite(id: id)
            } else {
                addFavorite(id: id)
            }
            
            isCardFavorite.toggle()
        }
    }
}
