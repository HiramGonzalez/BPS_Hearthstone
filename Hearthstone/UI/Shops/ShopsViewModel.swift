//
//  ShopsViewModel.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/24/23.
//
import GoogleMaps
import GooglePlaces
import Foundation
import SwiftUI

extension ShopsView {
    
    class ViewModel: ObservableObject {
        @StateObject var locationDataManager = LocationDataManager()
        
        init() {}
        
        func googleMapsView() -> some View {
            return GoogleMapsView()
        }
    }
}
