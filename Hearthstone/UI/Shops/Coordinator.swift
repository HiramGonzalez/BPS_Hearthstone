//
//  Coordinator.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/2/23.
//
import GoogleMaps
import Foundation

extension GoogleMapsView {
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: GoogleMapsView
        
        init(_ parent: GoogleMapsView){
            self.parent = parent
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            parent.selectedMarker?.icon = UIImage(named: "logo")
            parent.selectedMarker?.zIndex = 0
            
            marker.icon = UIImage(named: "logo")
            marker.zIndex = 1
            
            parent.selectedMarker = marker
            print("Tapped")
            return true
        }
    }
}
