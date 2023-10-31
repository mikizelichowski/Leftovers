//
//  CustomEmailTextField.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

struct CustomEmailTextField: View {
    var header: String
    var placeholder: String
    
    @Binding var text: String
    @FocusState private var focusedField: FocusedField?
    @State private var isValidEmail: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .regular))
            
            TextField(placeholder, text: $text)
                .focused($focusedField, equals: .email)
                .padding()
                .frame(height: 44)
                .cornerRadius(12)
                .background(
                 RoundedRectangle(cornerRadius: 12)
                    .stroke(!isValidEmail ? .red : focusedField == .email ? Color("green_color") : Color("rounded_color"), lineWidth: 1)
                )
                .onChange(of: text) { newValue in
                    isValidEmail = Validator.validateEmail(newValue)
                }
            if !isValidEmail {
                HStack {
                    Text("Your email is not valid")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.red)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
