//
//  RoundedButton.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 18/10/2023.
//

import Foundation
import SwiftUI

struct RoundedButton: View {
    var title: String
    var titleColor: Color = .white
    var foregroundColor: Color = .green
    var fontSize: CGFloat
    var image: String = ""
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(foregroundColor)
                    .frame(height: 54)
                    .padding()
                    .padding(.horizontal)
                HStack {
                    Text(title)
                        .foregroundColor(titleColor)
                        .font(.system(size: fontSize, weight: .bold))
                    
                    Image(image)
                }
            }
    }
}
