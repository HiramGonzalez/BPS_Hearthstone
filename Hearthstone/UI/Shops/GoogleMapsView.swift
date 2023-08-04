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
    @EnvironmentObject var shopDetails: ShopDetailsVariables
    @StateObject var locationDataManager = LocationDataManager()
    var placesList = PlacesList()
    @State private var markersAreVisible = false
    @State var selectedMarker: GMSMarker? {
        didSet {
            shopDetails.selectedMarker = selectedMarker
        }
    }
    var isAddressShowing = false {
        didSet {
            shopDetails.isDetailShowing.toggle()
        }
    }
    var selectedMarkerCoordinates: CLLocationCoordinate2D? {
        didSet {
            shopDetails.coordinates = selectedMarkerCoordinates
        }
    }

    @State private var selectedPlace: GMSPlaceLikelihood? = nil

    //@State private var markersLoaded = false
    
    let zoom: Float = 15.0
    
    func makeUIView(context: Context) -> GMSMapView {
        GMSServices.provideAPIKey("AIzaSyCuFTdTbQUp5ylRFIBx5ZdIgIllXckqMbA")
        
        let camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.clear()
        mapView.isUserInteractionEnabled = true
        mapView.delegate = context.coordinator
        mapView.alpha = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                mapView.alpha = 1
                markersAreVisible = true
                //markersLoaded = true
            }
        }
        
        return mapView
        
    }
    
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        //mapView.clear()
        mapView.camera = GMSCameraPosition.camera(withLatitude: locationDataManager.latitude, longitude: locationDataManager.longitude, zoom: zoom)
        if markersAreVisible {
            for index in 0..<placesList.places.count {
                let place = placesList.places[index]
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: place.place.coordinate.latitude, longitude: place.place.coordinate.longitude)
                marker.title = place.place.name
                marker.icon = UIImage(named: "marker")
                marker.opacity = 1.0
                marker.map = mapView
                print("Marker \(index) in lat:\(place.place.coordinate.latitude), lon: \(place.place.coordinate.longitude)")
            }
            
            if shopDetails.selectedMarker != nil {
                let marker = shopDetails.selectedMarker
                marker!.icon = UIImage(named: "markerTapped")
                marker!.opacity = 1.0
                marker!.map = mapView
            }
        }
    }

    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

