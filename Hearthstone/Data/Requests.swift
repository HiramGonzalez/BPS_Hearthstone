//
//  Requests.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/25/23.
//

import Foundation

class Requests: ObservableObject {
    @Published var classes: [String] = []
    @Published var searchResults: [Card] = []
    @Published var favoritesArray: [Card] = []
    
    enum searchType {
        case byClass, byName
    }
    
    init() {
        loadClasses()
    }
    
    func loadClasses() {
        let headers = [
            "X-RapidAPI-Key": "2bd303fc69msh2ad3f8f9e9eec0dp176f2ajsn4812ea7c5555",
            "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://omgvamp-hearthstone-v1.p.rapidapi.com/info")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            }
            
            if let data = data {
                if let decoded = try? JSONDecoder().decode(Classes.self, from: data){
                    self.classes = decoded.classes
                }
            } else {
                self.classes = []
                print("classes NOT loaded succesfully")
            }
        })

        dataTask.resume()
    }
    
    func getClasses() -> [String] {
        return classes
    }
    
    func getFavoriteCards(listId: [String]) -> [Card] {
        loadFavorites(favoritesId: listId)
        return favoritesArray
        //return searchResults
    }
    
    func getSearchResults(_ searchType: searchType, for terms: String) -> [Card] {
        searchByCardType(searchType, terms: terms)
        return searchResults
    }
    
    
    func searchByCardType(_ searchType: searchType, terms: String) {
        let headers = [
            "X-RapidAPI-Key": "2bd303fc69msh2ad3f8f9e9eec0dp176f2ajsn4812ea7c5555",
            "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/\(searchType == .byClass ? "classes" : "search")/\(terms.replacingOccurrences(of: " ", with: "%20"))")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
                if (error != nil) {
                    print(error as Any)
                }
                
                if let data = data {
                    if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                        self.searchResults = decoded
                    } else {
                        self.searchResults = []
                    }
                }
        }

        dataTask.resume()
    }
    
    func loadFavorites(favoritesId: [String]) {
        self.favoritesArray = []
        //var searchresults = [Card]()
        let headers = [
            "X-RapidAPI-Key": "2bd303fc69msh2ad3f8f9e9eec0dp176f2ajsn4812ea7c5555",
            "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
        ]
        

        
        DispatchQueue.main.async {
            for i in 0..<favoritesId.count {
                let request = NSMutableURLRequest(url: NSURL(string: "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/\(favoritesId[i])")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
                
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
                
                let session = URLSession.shared
                let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                    if (error != nil) {
                        print(error as Any)
                    }
                    
                    if let data = data {
                        if let decoded = try? JSONDecoder().decode([Card].self, from: data){
                            
                            self.favoritesArray.append(contentsOf: decoded)
                            
                            
                        }
                    }
                })
                
                dataTask.resume()
            }
        }
        //return self.searchResults
    }
}
