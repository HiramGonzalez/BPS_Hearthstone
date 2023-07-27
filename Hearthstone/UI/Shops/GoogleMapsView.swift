//
//  GoogleMapsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/21/23.
//

import GoogleMaps
import SwiftUI

struct GoogleMapsView: UIViewRepresentable {
    @StateObject var locationDataManager = LocationDataManager()
    
    func makeUIView(context: Context) -> GMSMapView {
        //GMSServices.provideAPIKey("AIzaSyCuFTdTbQUp5ylRFIBx5ZdIgIllXckqMbA")
        
        if locationDataManager.locationManager.authorizationStatus == .authorizedWhenInUse {
            let camera = GMSCameraPosition.camera(withLatitude: Double(locationDataManager.locationManager.location?.coordinate.latitude ?? 37.09), longitude: Double(locationDataManager.locationManager.location?.coordinate.longitude ?? -95.71), zoom: 15.0)
            return GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        } else {
            let camera = GMSCameraPosition.camera(withLatitude: 37.09, longitude: -95.71, zoom: 15.0)
            return GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        }
    }
    
    
    func updateUIView(_ mapView: UIViewType, context: Context) {
        mapView.camera = GMSCameraPosition.camera(withLatitude: Double(locationDataManager.locationManager.location?.coordinate.latitude ?? 37.09), longitude: Double(locationDataManager.locationManager.location?.coordinate.longitude ?? -95.71), zoom: 15.0)
    }
}

