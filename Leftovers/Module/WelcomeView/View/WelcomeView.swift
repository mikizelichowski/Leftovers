//
//  WelcomeView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 18/10/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("welcome_background")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image("welcome_icon")
                        Text("100K+ Premium Recipe")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 16) {
                        Text("Get \nCooking")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text("Simple way to find tasty Recipe")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: {
                            SignInView()
                        }, label: {
                            RoundedButton(title: "Start Cooking", foregroundColor: Color("green_color"),fontSize: 16, image: "arrow_right")
                                .padding(.top,40)
                                .padding(.bottom, 20)
                        })
                    }
                }
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
         
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}



