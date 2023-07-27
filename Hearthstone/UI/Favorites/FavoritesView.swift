//
//  FavoritesView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                
                Image("vfxBg")
                    .resizable()
                    .ignoresSafeArea()
                Image("particles")
                    .resizable()
                    .ignoresSafeArea()
                Image("gradient")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                VStack(alignment: .center) {
                    Text("Your Favorites")
                        .font(.custom("Montserrat-SemiBold", size: 22))
                        .foregroundColor(.white)
                        .padding([.leading, .bottom])
                    
                    
                    ScrollView {
                        VStack {
//                            ListCardView()
//                            ListCardView()
//                            ListCardView()
//                            ListCardView()
                        }
                        .padding(.bottom, geo.size.height / 7.5)
                    }
                    
                    
                }
                .padding(.top)
                
            }
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
