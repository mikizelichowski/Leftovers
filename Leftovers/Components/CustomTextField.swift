//
//  CustomTextField.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

struct CustomTextField: View {
    var header: String
    var placeholder: String
    
    @Binding var text: String
    @State private var isValidTxt: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .regular))
            
            TextField(placeholder, text: $text)
                .padding()
                .frame(height: 44)
                .cornerRadius(12)
                .background(
                 RoundedRectangle(cornerRadius: 12)
                    .stroke(!text.isEmpty ? Color("green_color") : Color("rounded_color"), lineWidth: 1)
                )
        }
        .padding(.horizontal)
    }
}
