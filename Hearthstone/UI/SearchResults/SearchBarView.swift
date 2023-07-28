//
//  SearchBarView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/20/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var search: String
    @State var isSearchResultsViewShowing: Bool
    @State private var presentSearchResultsView = false
    var viewModel: SearchResultsView.ViewModel?
    
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
            
            Button {
                if !isSearchResultsViewShowing {
                    presentSearchResultsView = true
                } else {
                    viewModel?.searchCards(withTerms: search)
                }
            } label: {
                Text("Search")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(Color(red: 0.985, green: 0.805, blue: 0.116, opacity: 1.0))
                    .fixedSize(horizontal: true, vertical: false)
            }
        }
        .padding(.horizontal)
        .navigationDestination(isPresented: $presentSearchResultsView) {
            SearchResultsView(searchTerm: search)
        }
    }
}

//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView(search: <#Binding<String>#>, isSearchResultsViewShowing: false, viewModel: nil)
//    }
//}
