//
//  NewCardView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 30/10/2023.
//

import SwiftUI

struct NewCardView: View {
    var title: String
    var image: String
    var rating: Int
    var author: String
    var time: Int
    var profileImage: String
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .lineLimit(1)
                        .font(.system(size: 14, weight: .medium))
                    
                    Image(image)
                        .frame(width: 88, height: 88)
                        .scaledToFit()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    ForEach(0...rating, id: \.self) { i in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }.padding(.top,-30)
                
                HStack {
                    HStack {
                        Image(profileImage)
                            .frame(width:25,height:25)
                            .scaledToFit()
                        Text(author)
                            .foregroundColor(.gray)
                            .font(.system(size: 11))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image("timer")
                        Text("\(time) mins")
                            .foregroundColor(.gray)
                            .font(.system(size: 11))
                    }
                    .padding(.trailing)
                }
                .padding(.bottom)
            }
            .padding(.leading)
            .frame(height: 120)
        }
        .frame(width: 250, height: 95)
    }
}
