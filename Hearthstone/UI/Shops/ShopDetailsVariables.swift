//
//  ShopDetailsVariables.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/3/23.
//

import Foundation
import GoogleMaps
import GooglePlaces

class ShopDetailsVariables: ObservableObject {
    @Published var isDetailShowing = false
    @Published var selectedMarker: GMSMarker? = nil
    @Published var coordinates: CLLocationCoordinate2D? = nil
}
