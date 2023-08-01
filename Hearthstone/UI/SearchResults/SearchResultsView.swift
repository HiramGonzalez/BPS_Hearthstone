//
//  SearchResultsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct SearchResultsView: View {
    @State var searchTerm: String
    @ObservedObject var viewModel: SearchResultsView.ViewModel
    @State private var didFinishLoading = false
    @ObservedObject var listViewModel = ListCardView.ViewModel(id: "")
    @EnvironmentObject var saveFavorites: SaveFavorites
    
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
                    
                    VStack(alignment: .leading) {
                        Text("Search results for \"\(searchTerm)\"")
                            .font(.custom("Montserrat-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding([.leading, .bottom])
                        
                        SearchBarView(search: $searchTerm, isSearchResultsViewShowing: true, viewModel: viewModel)
                            .padding(.bottom)
                        
                        ScrollView {
                            VStack() {
                                ForEach(viewModel.results, id: \.self) { card in
                                    NavigationLink(destination: CardOverviewView(cardId: card.cardId, name: card.name, playerClass: card.playerClass, image: card.img, type: card.type, rarity: card.rarity, cardSet: card.cardSet, text: card.text, viewModel: ListCardView.ViewModel(id: card.cardId))) {
                                        
                                        ListCardView(cardId: card.cardId, image: card.img, name: card.name, type: card.type, rarity: card.rarity, cardSet: card.cardSet)
                                            .frame(maxHeight: geo.size.height * 0.13)
                                            .padding(.top, geo.size.height > 600 ? geo.size.height * 0.125 : geo.size.height * 0.145)
                                            .onAppear {
                                                listViewModel.isThisCardFavorite(id: card.cardId)
                                            }
                                        
                                    }
                                    
                                    Spacer()
                                        .frame(width: geo.size.width, height: 90)
                                }
                                .onAppear {
                                    didFinishLoading = true
                                }
                            }
                            .padding(.bottom, geo.size.height / 7.5)
                            
                            if !didFinishLoading {
                                ProgressView()
                                    .tint(.yellow)
                                    .controlSize(.large)
                                    .frame(width: geo.size.width)
                            }
                            
                            
                        }
                    }
                }
                
                
            }
            .ignoresSafeArea(.keyboard)
        }
    }
    
    init(searchTerm: String) {
        self.searchTerm = searchTerm
        _viewModel = ObservedObject(initialValue: SearchResultsView.ViewModel(searchTerms: searchTerm.replacingOccurrences(of: " ", with: "%20")))
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchTerm: "Cat form")
    }
}
