//
//  SearchBarView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct SearchBarView: View {
    @State var search = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("resourcesSearch")
                    .padding(.leading, 15)
                TextField("Search cards", text: $search)
                    .foregroundColor(Color(red: 0.589, green: 0.544, blue: 0.471))
            }
            .font(.custom("Montserrat-Regular", size: 20))
            .padding(7)
            .background(Color.black.opacity(0.6))
            .clipShape(
                RoundedRectangle(cornerRadius: 30)
            )
            
            Spacer()
            
            NavigationLink {
                SearchResultsView()
            } label: {
                Text("Search")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(Color(red: 0.985, green: 0.805, blue: 0.116, opacity: 1.0))
                    .fixedSize(horizontal: true, vertical: false)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
