//
//  SearchResultsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct SearchResultsView: View {
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
                
                VStack(alignment: .leading) {
                    Text("Search results for \"Driud\"")
                        .font(.custom("Montserrat-SemiBold", size: 22))
                        .foregroundColor(.white)
                        .padding([.leading, .bottom])
  
                    SearchBarView()
                        .padding(.bottom)
                    
                    ScrollView {
                        VStack {
                            ListCardView()
                            ListCardView()
                            ListCardView()
                            ListCardView()
                        }
                        .padding(.bottom, geo.size.height / 7.5)
                    }
                    
                    
                }
                
//                NavigationTabView()
//                    .frame(width: geo.size.width)
            }
            
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}
