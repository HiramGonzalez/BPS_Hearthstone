//
//  ListCardView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct ListCardView: View {
    
    let image: String?
    let name: String
    let type: String?
    let rarity: String?
    let cardSet: String?
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Image(image ?? "No image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width * 0.28, height: geo.size.width * 0.28)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.custom("Montserrat-Bold", size: 16))
                    Group {
                        Text(type ?? "")
                        Text(rarity ?? "")
                        Text(cardSet ?? "")
                    }
                    .font(.custom("Montserrat-Regular", size: 16))
                    .padding(.leading)
                }
                Spacer()
                Image("heartOutline")
            }
            .padding()
            .background(Color.white.opacity(0.45))
            .frame(height: geo.size.height * 0.13)
            
        }
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(image: nil, name: "Bear form", type: "Spell", rarity: "Common", cardSet: "Vanilla")
    }
}
