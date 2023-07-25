//
//  CardOverviewView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct CardOverviewView: View {
    var body: some View {
        
            ZStack() {
                GeometryReader { geo in
                Image("vfxBg1")
                    .resizable()
                    .ignoresSafeArea()
                Image("particles")
                
                
                VStack {
                    VStack {
                        Text("Mana Bind")
                            .font(.custom("Montserrat-Medium", size: 22))
                            .foregroundColor(.white)
                        Text("Mage")
                            .font(.custom("Montserrat-Medium", size: 22))
                            .foregroundColor(Color(red: 0.985, green: 0.805, blue: 0.116))
                        
                    }
                    
                    HStack {
                        Spacer()
                        Image("heartOutline")
                            .resizable()
                            .frame(width: geo.size.height * 0.05, height: geo.size.height * 0.05)
                            .scaledToFit()
                    }
                    .padding(.horizontal)
                    
                    Image("rectangle")
                        .resizable()
                        .frame(width: geo.size.height * 0.304, height: geo.size.height * 0.4)
                        .scaledToFit()
                        .padding(.bottom)
                    
                    ZStack {
                        Image("3DTouchBg")
                            .resizable()
                            .frame(minWidth: geo.size.width, minHeight: geo.size.height * 0.2)
                            .scaledToFit()
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Type: Spell")
                            Text("Rarity: Rare")
                            Text("Set: Journey to Un'Goro")
                            Text("Effect: Secret: when your opponent casts a spell, add a copy to your hand that costs (0).")
                        }
                        .padding()
                    }
                    .frame(minWidth: geo.size.width)
                    
                    Spacer()
                    //NavigationTabView()
                }
                .frame(width: geo.size.width, height: geo.frame(in: .local).height)
            }
            
        }
    }
}

struct CardOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        CardOverviewView()
    }
}
