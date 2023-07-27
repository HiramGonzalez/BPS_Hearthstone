//
//  CardTypeView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct CardTypeView: View {
    let searchTerm: String
    @StateObject var viewModel: CardTypeView.ViewModel
    
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
                    Text(searchTerm)
                        .font(.custom("Montserrat-SemiBold", size: 22))
                        .foregroundColor(.white)
                        .padding([.leading, .bottom])
                    
                    
                    ScrollView {
                        VStack() {
                    
                            ForEach(viewModel.results, id: \.self) { card in
                                ListCardView(image: card.img, name: card.name, type: card.type, rarity: card.rarity, cardSet: card.cardSet)
                                    .frame(maxHeight: geo.size.height * 0.13)
                                    .padding(.top, geo.size.height > 700 ? geo.size.height * 0.11 : geo.size.height * 0.13)
                                
                                Spacer()
                                    .frame(height: geo.size.height > 700 ? geo.size.height * 0.12 : geo.size.height * 0.15)
                                
                            }
                        }
                        .padding(.bottom, geo.size.height / 7.5)
                    }
                    
                    
                }
            }
            
        }
    }
    
    init(searchTerm: String) {
        self.searchTerm = searchTerm
        
        _viewModel = StateObject(wrappedValue: CardTypeView.ViewModel(searchTerm: searchTerm.replacingOccurrences(of: " ", with: "%20")))
    }
}

struct CardTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CardTypeView(searchTerm: "Druid")
    }
}
