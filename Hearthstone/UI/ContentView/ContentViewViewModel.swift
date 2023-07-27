//
//  ContentViewViewModel.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/25/23.
//
import Combine
import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @ObservedObject var requests = Requests()
        var subscriptions = Set<AnyCancellable>()
        @Published var classes = [String]()
        //@Published var carrouselIndex: Int = 0
        
        init() {
            loadClasses()
            
            requests.$classes
                .receive(on: DispatchQueue.main)
                .sink { [weak self] updatedValue in
                    self?.manuallyUpdate(updatedValue)
                }
                .store(in: &subscriptions)
        }
        
        func loadClasses() {
            classes = requests.getClasses()
            print("loadClasses executed from viewModel")
            print(classes)
        }
        
        func manuallyUpdate(_ updatedValue: [String]) {
            self.classes = updatedValue
            print("Manually updated")
        }
    }
}
