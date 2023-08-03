//
//  ShopsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/21/23.
//
//import GoogleMaps
import SwiftUI

struct ShopsView: View {
    @EnvironmentObject var shopDetails: ShopDetailsVariables
    @State var search = ""
    @State var showDetails = false
    @State var mapView = GoogleMapsView()
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                
                VStack(spacing: 0) {
                    mapView
                        .environmentObject(shopDetails)
//                        .sheet(isPresented: $mapView.isAddressShowing) {
//                            ShopDetailsView()
//                        }
                    //Color.cyan.opacity(0.5)
                    
                    if shopDetails.isDetailShowing {
                        ShopDetailsView()
                    }
                    
                }
                
                TextField("Search card shops", text: $search)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(3)
                    .padding()
                    .shadow(radius: 3, x: 0, y: 2)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
    }
}
