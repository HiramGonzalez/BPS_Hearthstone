//
//  Coordinator.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/2/23.
//
import GoogleMaps
import SwiftUI
import UIKit
import Foundation

extension GoogleMapsView {
    
    class Coordinator: NSObject, GMSMapViewDelegate, ObservableObject {
        var parent: GoogleMapsView
        
        init(_ parent: GoogleMapsView){
            self.parent = parent
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> (Bool) {
            parent.selectedMarker?.icon = UIImage(named: "marker")
            parent.selectedMarker?.zIndex = 0
            
            marker.icon = UIImage(named: "markerTapped")
            marker.zIndex = 1
            
            parent.selectedMarker = marker
            parent.selectedMarkerCoordinates = marker.position
            print("Tapped")
            parent.isAddressShowing = true
            return (true)
        }
        
//        func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
//            print("Showing marker info")
//            let callout = UIHostingController(rootView: ShopDetailsView())
//            parent.presentedViewController = callout
//        }
        
    }
}
