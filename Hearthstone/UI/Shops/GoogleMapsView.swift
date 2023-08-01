//
//  GoogleMapsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/21/23.
//

import GoogleMaps
import GooglePlaces
import SwiftUI

struct GoogleMapsView: UIViewRepresentable {
    
    @StateObject var locationDataManager = LocationDataManager()
    var placesList = PlacesList()
    let zoom: Float = 15.0
    
    func makeUIView(context: Context) -> GMSMapView {
        GMSServices.provideAPIKey("AIzaSyCuFTdTbQUp5ylRFIBx5ZdIgIllXckqMbA")
        
        
        let camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
        return GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
//        if locationDataManager.locationManager.authorizationStatus == .authorizedWhenInUse {
////            let camera = GMSCameraPosition.camera(withLatitude: Double(locationDataManager.locationManager.location?.coordinate.latitude ?? 37.09), longitude: Double(locationDataManager.locationManager.location?.coordinate.longitude ?? -95.71), zoom: 15.0)
//            let camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
//            return GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        } else {
//            let camera = GMSCameraPosition.camera(withLatitude: 37.09, longitude: -95.71, zoom: 15.0)
//            return GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        }
    }
    
    
    func updateUIView(_ mapView: UIViewType, context: Context) {
        mapView.camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
        for index in 0..<placesList.places.count {
//            let marker = GMSMarker(position: place.place.coordinate!)
//            marker.title = "HearthStone Card Shoppe"
//            marker.map = mapView
            let place = placesList.places[index]
            let marker = GMSMarker(position: place.place.coordinate)
            marker.title = "HearthStone Card Shoppe"
            marker.map = mapView
        }
    }
}

