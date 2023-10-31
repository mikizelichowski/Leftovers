//
//  SignInView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @State private var isOpenSignUpView: Bool = false
    @State private var isOpenMainView: Bool = false
    
    var canProceed: Bool {
        Validator.validateEmail(viewModel.emailTxt) &&
        Validator.validatePassword(viewModel.passwordTxt)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color("background_color").ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading) {
                        Text("Hello")
                            .foregroundColor(.black)
                            .font(.system(size: 30, weight: .bold))
                        Text("Welcome Back!")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .regular))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, 12)
                    .padding(.leading, 30)
                    
                    VStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 15) {
                            CustomEmailTextField(header: "Email",
                                            placeholder: "Enter email",
                                            text: $viewModel.emailTxt)
                            
                            CustomPasswordTextField(header: "Enter Password",
                                            placeholder: "Enter password",
                                                    text: $viewModel.passwordTxt,
                                                    validatePassword: Validator.validatePassword,
                                                    errorTxt: "Your password is not valid")
                            
                            Button(action: {}, label: {
                                Text("Forgot Password?")
                                    .foregroundColor(Color("yellow_txt_color"))
                                    .font(.system(size: 11, weight: .regular))
                            })
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                        
                        RoundedButton(title: "Sign In", foregroundColor: Color("green_color"), fontSize: 16, image: "arrow_right")
                            .onTapGesture {
                                self.isOpenMainView.toggle()
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .opacity(canProceed ? 1.0 : 0.5)
                            .disabled(!canProceed)
                    }
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(Color("rounded_color"))
                            .frame(width: 50, height: 1)
                        Text("or Sign in With")
                            .foregroundColor(Color("rounded_color"))
                            .font(.system(size: 11))
                        Rectangle()
                            .foregroundColor(Color("rounded_color"))
                            .frame(width: 50, height: 1)
                    }
                    
                    // MARK: login buttons
                    HStack {
                        Button(action: {
                            // action
                        }, label: {
                            Image("gmail")
                        })
                        
                        Button(action: {
                            // action
                        }, label: {
                            Image("fb")
                        })
                    }
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                        
                        Button(action: {
                            isOpenSignUpView.toggle()
                        }, label: {
                            Text("Sign up")
                                .foregroundColor(Color("yellow_txt_color"))
                                .font(.system(size: 11, weight: .regular))
                        })
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 50)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .fullScreenCover(isPresented: $isOpenMainView, content: {
            MainView()
        })
        .fullScreenCover(isPresented: $isOpenSignUpView) {
            SignUpView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
