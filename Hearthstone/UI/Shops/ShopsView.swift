//
//  ShopsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/21/23.
//

import SwiftUI

struct ShopsView: View {
    @State var search = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                
                VStack(spacing: 0) {
                    //GoogleMapsView()
                    //Color.cyan.opacity(0.5)
//                    NavigationTabView()
//                        .frame(width: geo.size.width)
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
