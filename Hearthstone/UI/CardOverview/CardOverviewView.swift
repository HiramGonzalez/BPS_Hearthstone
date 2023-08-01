//
//  CardOverviewView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct CardOverviewView: View {
    let cardId: String
    let name: String
    let playerClass: String?
    let image: String?
    let type: String?
    let rarity: String?
    let cardSet: String?
    let text: String?
    
    //@ObservedObject var viewModel: CardOverviewView.ViewModel
    @ObservedObject var viewModel: ListCardView.ViewModel
    
    var body: some View {
        
            ZStack() {
                GeometryReader { geo in
                    Image("vfxBg1")
                        .resizable()
                        .ignoresSafeArea()
                    Image("particles")
                    
                    
                    VStack {
                        VStack {
                            Text(name)
                                .font(.custom("Montserrat-Medium", size: 22))
                                .foregroundColor(.white)
                            Text(playerClass ?? "")
                                .font(.custom("Montserrat-Medium", size: 22))
                                .foregroundColor(Color(red: 0.985, green: 0.805, blue: 0.116))
                            
                        }
                        
                        HStack {
                            Spacer()
                            Image(viewModel.isCardFavorite ? "basicHeartFill" : "heartOutline")
                                .resizable()
                                .frame(width: geo.size.height * 0.05, height: geo.size.height * 0.05)
                                .scaledToFit()
                                .onTapGesture {
                                    viewModel.addOrRemoveCard(id: cardId)
                                }
                        }
                        .padding(.horizontal)
                        
                        AsyncImage(url: URL(string: image ?? "notValid")) { phase in
                            switch phase {
                            case .failure:
                                Image("No image").resizable()
                            case .success(let image):
                                image.resizable()
                            default:
                                ProgressView()
                            }
                        }
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.height * 0.304, height: geo.size.height * 0.4)
                        .scaledToFit()
                        .padding(.bottom)
                        
                        ZStack {
                            Image("3DTouchBg")
                                .resizable()
                                .frame(minWidth: geo.size.width, minHeight: geo.size.height * 0.2)
                                .scaledToFit()
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    if type != nil {
                                        Text("Type: ").bold() +
                                        Text(type!)
                                    }
                                    
                                    if rarity != nil {
                                        Text("Rarity: ").bold() +
                                        Text(rarity!)
                                    }
                                    
                                    if cardSet != nil {
                                        Text("Set: ").bold() +
                                        Text(cardSet!)
                                    }
                                    
                                    if text != nil {
                                        Text("Effect: ").bold() +
                                        Text(text!)
                                    }
                                    
                                }
                                .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        .frame(minWidth: geo.size.width)
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width, height: geo.frame(in: .local).height)
                }
            
            
        }
    }
    
    init(cardId: String, name: String, playerClass: String?, image: String?, type: String?, rarity: String?, cardSet: String?, text: String?, viewModel: ListCardView.ViewModel) {
        self.cardId = cardId
        self.name = name
        self.playerClass = playerClass
        self.image = image
        self.type = type
        self.rarity = rarity
        self.cardSet = cardSet
        self.text = text
        self.viewModel = viewModel
        
        //_viewModel = ObservedObject(initialValue: CardOverviewView.ViewModel(id: cardId))
    }
}

struct CardOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        CardOverviewView(cardId: "UNG_024", name: "Mana Bind", playerClass: "Mage", image: "https://d15f34w2p8l1cc.cloudfront.net/hearthstone/f327e479d5e131bcfab675b5947d413747cb6302de58d0357af10f76baa4e800.png", type: "Spell", rarity: "Rare", cardSet: "Journey to Un'Goro", text: "<b>Secret:</b> When your opponent casts a spell, add a copy to your hand that costs (0).", viewModel: ListCardView.ViewModel(id: "UNG_024"))
    }
}
