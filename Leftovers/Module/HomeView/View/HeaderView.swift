//
//  HeaderView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 30/10/2023.
//

import SwiftUI

struct HeaderView: View {
    var image: String
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .medium))
                Text(subtitle)
                    .foregroundColor(Color("gray_color"))
                    .font(.system(size: 11, weight: .regular))
                }
            
            Spacer()
            
            Image(image)
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("yellow_light_color"))
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
}
