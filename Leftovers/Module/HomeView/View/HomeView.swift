//
//  HomeView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
            ZStack {
                Color("rounded_color").opacity(0.1).ignoresSafeArea()
                
                VStack {
                    HeaderView(image: "profile_view", title: "Hello Fola", subtitle: "What are you cooking today?")
                    
                    HStack {
                        /// Search bar
                        SearchBar(text: $viewModel.searchText, isLoading: $viewModel.isLoading)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.vertical)
                     
                        Button(action: {}, label: {
                            Image("setting_icon")
                                .scaledToFit()
                        })
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("green_color"))
                        ).padding(.horizontal)
                    }
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.tags, id:\.self) { value in
                                Button(action: {
                                    viewModel.isSelectedTag = value
                                }, label: {
                                    Text("\(value)")
                                        .foregroundColor(viewModel.isSelectedTag == value ? .white : Color("green_color"))
                                })
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .fill(viewModel.isSelectedTag == value ? Color("green_color") : .white)
                                    .frame(height: 31)
                                )
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.recipes, id: \.id) { item in
                                    CardFood(title: item.title,
                                             time: item.time,
                                             image: item.image)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .frame(height: 300)
                        
                        VStack(alignment: .leading) {
                            Text("New Recipes")
                                .foregroundColor(.black)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewModel.newRecipe, id:\.id) { item in
                                        NewCardView(title: item.title,
                                                    image: item.image,
                                                    rating: Int(item.rating ?? 0),
                                                    author: item.author ?? "",
                                                    time: item.time,
                                                    profileImage: item.profileImage ?? "")
                                    }
                                }
                            }
                            .frame(height: 180)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.top, -50)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("rounded_color").opacity(0.1).ignoresSafeArea()
            HomeView()
        }
    }
}
