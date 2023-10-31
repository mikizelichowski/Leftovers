//
//  SearchBar.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 25/10/2023.
//

import SwiftUI

struct SearchBar: View {
    //    @State private var text: String = ""
    @Binding var text: String
    
    @State private var isEditing = false
    
    //    @State private var isLoading = false
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
                .frame(width: 270, height: 40)
                .cornerRadius(10)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("gray_color"))
                    .padding(.leading, 10)
                
                TextField("Search recipe", text: $text)
                    .padding(7)
                    .padding(.leading, -7)
                    .background(Color.white)
                    .disableAutocorrection(true)
                    .cornerRadius(20)
                    .foregroundColor(Color("green_color"))
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                
                if !text.isEmpty {
                    if isLoading {
                        Button(action: {
                            // Clear text
                            text = ""
                        }, label: {
                            //                    ActivityIndicator(style: .medium, animate: .constant(true))
                            //                        .configure {
                            //                            $0.color = .black
                            //                        }
                        })
                        .padding(.trailing, 32)
                        .frame(width: 35, height: 35)
                        
                    }else {
                        Button(action: {
                            /// Clear text
                            text = ""
                            // Hide Keyboard
                            UIApplication.shared.endEditing()
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color("gray_color"))
                                .frame(width: 35, height: 35)
                        })
                        .padding(.trailing, 18)
                    }
                }
                
                if isEditing {
                    Button(action: {
                        /// Clear Text, hide both buttons, give up first-responder
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Anuluj")
                            .foregroundColor(Color("green_color"))
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing) )
                    .animation(.default, value: 0)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
