//
//  AddressRequest.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/3/23.
//
import CoreLocation
import Foundation

class AddressRequest: ObservableObject {
    @Published var decodedAddress: String = ""
    
    init() {
        
    }
    
    func getAddressFromCoordinates(_ coordinates: CLLocationCoordinate2D) {
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(coordinates.latitude),\(coordinates.longitude)&key=AIzaSyDKg_PMsMpzZqg5gHDpSXaEVn3_-KyAv00") else { return }
        print(url)
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Error in AddressRequest: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let decodeAddress = try JSONDecoder().decode(Results.self, from: data)
                        self.decodedAddress = decodeAddress.results.first?.formatted_address ?? "No data"
                        print("Retrieved address: \(decodeAddress.results.first?.formatted_address ?? "Error")")
                    } catch let error {
                        print("Error decoding: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask.resume()
    }
}
