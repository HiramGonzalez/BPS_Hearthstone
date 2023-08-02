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
    @State var selectedMarker: GMSMarker?
    let zoom: Float = 15.0
    
    func makeUIView(context: Context) -> GMSMapView {
        GMSServices.provideAPIKey("AIzaSyCuFTdTbQUp5ylRFIBx5ZdIgIllXckqMbA")
        
        let camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.clear()
        mapView.isUserInteractionEnabled = true
        mapView.delegate = context.coordinator
        
        return mapView
        
    }
    
    
    func updateUIView(_ mapView: UIViewType, context: Context) {
        mapView.clear()
        mapView.camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
        for index in 0..<placesList.places.count {
            let place = placesList.places[index]
            let marker = GMSMarker()
            //marker = GMSMarker(position: place.place.coordinate)
            marker.position = CLLocationCoordinate2D(latitude: place.place.coordinate.latitude, longitude: place.place.coordinate.longitude)
            marker.title = "HearthStone Card Shoppe"
            marker.icon = UIImage(named: "marker")
            marker.opacity = 1.0
            marker.map = mapView
            print("Marker \(index) in lat:\(place.place.coordinate.latitude), lon: \(place.place.coordinate.longitude)")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

