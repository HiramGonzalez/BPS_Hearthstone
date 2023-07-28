//
//  CardTypeViewModel.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/26/23.
//
import Combine
import Foundation
import SwiftUI

extension CardTypeView {
    
    class ViewModel: ObservableObject {
        @ObservedObject var requests = Requests()
        //var searchTerm: String
        var subscriptions = Set<AnyCancellable>()
        @Published var results: [Card] = []
        
        init(searchTerm: String) {
            //self.searchTerm = searchTerm
            searchCards(ofClass: searchTerm)
            
            requests.$searchResults
                .receive(on: DispatchQueue.main)
                .sink { [weak self] newResults in
                    self?.updateManually(newResults)
                }
                .store(in: &subscriptions)
            //searchCards(ofClass: searchTerm)
        }
        
        func searchCards(ofClass type: String) {
            results = requests.getSearchResults(.byClass, for: type)
        }
        
        func updateManually(_ newResults: [Card]) {
            results = newResults
        }
    }
    
}
