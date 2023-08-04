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
    var addressRequest = AddressRequest()
    @Published var isDetailShowing = false
    @Published var selectedMarker: GMSMarker? = nil //{
//        didSet {
//            self.placeName = selectedMarker?.title
//        }
//    }
    @Published var formattedAddress: String? = nil
    //var placeName: String? = nil
    @Published var coordinates: CLLocationCoordinate2D? = nil {
        didSet {
            addressRequest.getAddressFromCoordinates(coordinates!)
            self.formattedAddress = addressRequest.decodedAddress
        }
    }
    
}
