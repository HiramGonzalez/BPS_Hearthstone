//
//  ListCardView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct ListCardView: View {
    var body: some View {
        
            
            HStack {
                Image("photo")
                    //.resizable()
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Bear Form")
                        .font(.custom("Montserrat-Bold", size: 16))
                    Group {
                        Text("Spell")
                        Text("Common")
                        Text("Vanilla")
                    }
                    .font(.custom("Montserrat-Regular", size: 16))
                    .padding(.leading)
                }
                Spacer()
                Image("heartOutline")
            }
            .padding()
            .background(Color.white.opacity(0.45))
        
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView()
    }
}
