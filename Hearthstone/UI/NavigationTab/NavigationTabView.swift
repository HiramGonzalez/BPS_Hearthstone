//
//  NavigationTabView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/19/23.
//

import SwiftUI

struct NavigationTabView: View {
    //@State var geo: GeometryProxy
    
    @State private var selectedTab = 0
    
    @ViewBuilder var selectedTabView: some View {
        switch selectedTab {
        case 0:
            ContentView()
        case 1:
            FavoritesView()
        default:
            ShopsView()
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            selectedTabView
            
            ZStack {
                Image("navYellowEmpty")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Button {
                        selectedTab = 0
                    } label: {
                        Image(selectedTab == 0 ? "bottomNavElementsAOnPrimaryActiveLight" : "bottomNavMainAOnPrimaryInactiveLight")
                    }
                    
                    Button {
                        selectedTab = 1
                    } label: {
                        Image(selectedTab == 1 ? "bottomNavFavoritesAOnPrimaryActiveLight" : "bottomNavFavoritesAOnPrimaryInactiveLight")
                    }
                    
                    Button {
                        selectedTab = 2
                    } label: {
                        Image(selectedTab == 2 ? "bottomNavShopsAOnPrimaryActiveLight" : "bottomNavShopsAOnPrimaryInactiveLight")
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    
                }
            }
            
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct NavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabView()
    }
}
