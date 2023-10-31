//
//  CustomPasswordTextField.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

struct CustomPasswordTextField: View {
    var header: String
    var placeholder: String
    
    @Binding var text: String
    @FocusState private var focusedField: FocusedField?
    @State private var isValidPassword: Bool = true
    let validatePassword: (String) -> Bool
    let errorTxt: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .regular))
            
            SecureField(placeholder, text: $text)
                .focused($focusedField, equals: .password)
                .padding()
                .frame(height: 44)
                .cornerRadius(12)
                .background(
                 RoundedRectangle(cornerRadius: 12)
                    .stroke(!isValidPassword ? .red : focusedField == .password ? Color("green_color") : Color("rounded_color"), lineWidth: 1)
                )
                .onChange(of: text) { newValue in
                    isValidPassword = validatePassword(newValue)
                }
            if !isValidPassword {
                HStack {
                    Text(errorTxt)
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.red)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
