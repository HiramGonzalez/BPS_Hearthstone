//
//  ListCardView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct ListCardView: View {
    let cardId: String
    let image: String?
    let name: String
    let type: String?
    let rarity: String?
    let cardSet: String?
    
    @ObservedObject var viewModel: ListCardView.ViewModel
    
    @State private var relaodView = false
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                AsyncImage(url: URL(string: (image ?? "notValid"))) { phase in
                    switch phase {
                    case .failure:
                        Image("No image").resizable()
                    case .success(let image): image.resizable()
                    default:
                        ProgressView()
                    }
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.size.width * 0.28, height: geo.size.width * 0.32)
                .padding(.horizontal)
                
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.custom("Montserrat-Bold", size: 16))
                    Spacer()
                    Group {
                        Text(type ?? "")
                        Text(rarity ?? "")
                        Text(cardSet ?? "")
                    }
                    .font(.custom("Montserrat-Regular", size: 16))
                    .padding(.leading)
                }
                .foregroundColor(.black)
                Spacer()
                Image(viewModel.isCardFavorite ? "basicHeartFill" : "heartOutline")
//                    .onTapGesture {
//                        viewModel.addOrRemoveCard(id: cardId)
//                    }
            }
            .padding()
            .background(Color.white.opacity(0.45))
            .frame(height: geo.size.height * 0.13)
            
        }
    }
    
    init(cardId: String, image: String?, name: String, type: String?, rarity: String?, cardSet: String?) {
        self.cardId = cardId
        self.image = image
        self.name = name
        self.type = type
        self.rarity = rarity
        self.cardSet = cardSet
        
        _viewModel = ObservedObject(initialValue: ListCardView.ViewModel(id: cardId))
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(cardId: "Ysera", image: nil, name: "Bear form", type: "Spell", rarity: "Common", cardSet: "Vanilla")
    }
}
