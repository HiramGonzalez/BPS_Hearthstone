//
//  ShopDetailsView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/2/23.
//

import SwiftUI

struct ShopDetailsView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        GeometryReader { geo in
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                                
                                Image("direction")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding(.trailing, 80)
                            .position(x: geo.frame(in: .local).maxX , y: geo.frame(in: .local).minY)
                        }
                        .frame(height: 35)
                    }
                }
                Text("Hearthstone Card Shopee")
                    .font(.system(size: 21))
                    .padding(.horizontal)
                    .padding(.bottom, 9)
                HStack {
                    Text("Card Shop")
                    Spacer()
                    Text("5 min")
                }
                .padding(.horizontal)
                .padding(.bottom, 9)
                .font(.system(size: 16))
            }
            .background(Color.init(red: 98/255, green: 0, blue: 238/255))
            .foregroundColor(.white)
            
            HStack {
                Image("marker")
                Text("313 Noodle Ave.")
                Spacer()
            }
            .padding(.vertical, 34)
            .padding(.leading)
        }
    }
}


struct ShopDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailsView()
    }
}
