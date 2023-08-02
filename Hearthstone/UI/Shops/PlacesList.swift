//
//  PlacesList.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/1/23.
//

import Foundation
import GooglePlaces

class PlacesList: NSObject, ObservableObject {
    private var placesClient: GMSPlacesClient = GMSPlacesClient.shared()
    @Published var places = [GMSPlaceLikelihood]()
    
    override init() {
        super.init()
        //GMSPlacesClient.provideAPIKey("AIzaSyCieTBF_KFuGwSUwrNuNfB8GEJ-6KvGYR4")
        
        currentPlacesList { (places) in
            guard let places = places else { return }
            self.places = places
            print("Places updated 2")
        }
    }
    
    func currentPlacesList(completion: @escaping(([GMSPlaceLikelihood]?) -> Void )) {
        placesClient.currentPlace { (placeLikelyhoodList, error) in
            if let error = error {
                print("Error in current places list: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let placeLikelyhoodList = placeLikelyhoodList else { return }
            self.places = placeLikelyhoodList.likelihoods
            print("Places updated 1")
            completion(self.places)
        }
    }
}
