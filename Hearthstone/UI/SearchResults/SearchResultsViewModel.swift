//
//  SearchResultsViewModel.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/27/23.
//
import Combine
import Foundation
import SwiftUI

extension SearchResultsView {
    
    class ViewModel: ObservableObject {
        @ObservedObject var requests = Requests()
        var subscriptions = Set<AnyCancellable>()
        @Published var results: [Card] = []
        @Published var searchTerms: String
        @Published var didFinish = false
        
        init(searchTerms: String) {
            self.searchTerms = searchTerms
            searchCards(withTerms: searchTerms.replacingOccurrences(of: " ", with: "%20"))
            
            requests.$searchResults
                .receive(on: DispatchQueue.main)
                .sink { [weak self] newResults in
                    self?.manuallyUpdate(newResults)
                }
                .store(in: &subscriptions)
        }
        
        func searchCards(withTerms terms: String) {
            DispatchQueue.global().async {
                self.results.removeAll()
                self.results = self.requests.getSearchResults(.byName, for: terms)
                
            }
        }
        
        func manuallyUpdate(_ newResults: [Card]) {
            results = newResults
        }
    }
}
