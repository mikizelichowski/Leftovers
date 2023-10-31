//
//  CardFood.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 30/10/2023.
//

import SwiftUI

struct CardFood: View {
    var title: String
    var time: Int
    var image: String
    
    var body: some View {
        ZStack {
                VStack {
                    Text(title)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .font(.system(size: 14, weight: .medium))
                        .frame(width: 130)
                    
                    HStack {
                        VStack(alignment:.leading){
                            Text("Time")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(Color("gray_color"))
                            Text("\(time) Mins")
                                .font(.system(size: 11, weight: .medium))
                        }
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image("recipe_icon")
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .padding(-10)
                                )
                        })
                        
                    }
                    .frame(maxWidth: .infinity)
                    .offset(y: 20)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("gray_color").opacity(0.4))
                        .frame(height: 150)
                        .padding(.horizontal,-15)
                       
                ).padding(.horizontal)
                
            .overlay {
                ZStack{
                    Image(image)
                        .offset(y: -80)
                }
            }
        }
    }
}
