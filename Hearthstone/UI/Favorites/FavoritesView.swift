//
//  FavoritesView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel: FavoritesView.ViewModel = FavoritesView.ViewModel()
    @State private var didFinishLoading = false
    @ObservedObject var listViewModel = ListCardView.ViewModel(id: "")
    
    var body: some View {
        NavigationStack {
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
                                if !didFinishLoading {
                                    ProgressView()
                                        .controlSize(.large)
                                        .tint(.yellow)
                                }
                                
                                ForEach(viewModel.favoriteCards, id: \.self) { card in
                                    NavigationLink {
                                        CardOverviewView(cardId: card.cardId, name: card.name, playerClass: card.playerClass, image: card.img, type: card.type, rarity: card.rarity, cardSet: card.cardSet, text: card.text, viewModel: ListCardView.ViewModel(id: card.cardId))
                                    } label: {
                                        ListCardView(cardId: card.cardId, image: card.img, name: card.name, type: card.type, rarity: card.rarity, cardSet: card.cardSet)
                                            .frame(maxHeight: geo.size.height * 0.13)
                                            .padding(.top, geo.size.height > 600 ? geo.size.height * 0.125 : geo.size.height * 0.145)
                                    }
                                    
                                    
                                    Spacer()
                                        .frame(width: geo.size.width, height: 90)
                                    
                                }
                                .onAppear {
                                    didFinishLoading = true
                                }
                                
                            }
                            //.environmentObject(saveFavorites)
                            .padding(.bottom, geo.size.height / 7.5)
                        }
                    }
                    .padding(.top)
                }
            }
            //.environmentObject(saveFavorites)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
