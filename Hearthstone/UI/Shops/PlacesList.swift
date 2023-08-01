//
//  PlacesList.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/1/23.
//

import Foundation
import GooglePlaces

class PlacesList: NSObject, ObservableObject {
    private var placesClient = GMSPlacesClient.shared()
    @Published var places = [GMSPlaceLikelihood]()
    
    override init() {
        super.init()
        
        currentPlacesList { (places) in
            guard let places = places else { return }
            self.places = places
        }
    }
    
    func currentPlacesList(completion: @escaping(([GMSPlaceLikelihood]?) -> Void )) {
        placesClient.currentPlace { (placeLikelyhoodList, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let placeLikelyhoodList = placeLikelyhoodList else { return }
            self.places = placeLikelyhoodList.likelihoods
            print(self.places)
            completion(self.places)
        }
    }
}
