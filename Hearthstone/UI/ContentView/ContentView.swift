//
//  ContentView.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentView.ViewModel()
    @State private var index = 0
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack(alignment: .bottom) {
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                    Image("particles")
                        .resizable()
                        .ignoresSafeArea()
                    Image("tint")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("emblem")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.frame(in: .global).width * 0.84, height: geo.frame(in: .global).height * 0.11)
                            .padding(.top)
                            .padding(.horizontal)
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.frame(in: .global).width * 0.36, height: geo.frame(in: .global).height * 0.099)
                            .padding(.bottom, 32)
                            .padding(.top)
                        
                        SearchBarView()
                            .padding(.bottom, 0)
                        
                        Spacer()
                        
                        VStack(spacing: 0) {
                            TabView(selection: $index) {
                                ForEach(0..<viewModel.classes.count, id: \.self) { index in
                                    NavigationLink {
                                        CardTypeView(searchTerm: viewModel.classes[index])
                                    } label: {
                                        VStack {
                                            Image((UIImage(named: viewModel.classes[index]) != nil) ? viewModel.classes[index] : "No image")
                                                .resizable()
                                                .frame(width: geo.size.height / 3, height: geo.size.height / 3)
                                            Text(viewModel.classes[index])
                                                .font(.custom("Montserrat-SemiBold", size: 24))
                                                .foregroundColor(Color(red: 0.985, green: 0.805, blue: 0.116, opacity: 1.0))
                                                .padding(.top, 8)
                                        }
                                    }
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(width: geo.size.width, height: geo.size.height / 2.15)
                            
                            HStack(spacing: 10) {
                                ForEach(0..<viewModel.classes.count, id: \.self) { index in
                                    Circle()
                                        .foregroundColor(self.index == index ? Color.yellow : Color.white)
                                        .frame(width: 12, height: 12)
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                }
                .ignoresSafeArea(.keyboard)
            }
            .ignoresSafeArea(.keyboard)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
