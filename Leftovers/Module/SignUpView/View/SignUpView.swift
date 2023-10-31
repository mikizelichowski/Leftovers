//
//  SignUpView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    
    var canProceed: Bool {
        Validator.validateEmail(viewModel.emailTxt) &&
        Validator.validatePassword(viewModel.passwordTxt) &&
        Validator.validatePassword(viewModel.confirmPassword) &&
        viewModel.isAcceptTerms
    }
    
    func validateConfirm(_ password: String) -> Bool {
        viewModel.passwordTxt == password
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background_color").ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading) {
                        Text("Create an account")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .bold))
                        Text("Let's help you set your account,\nit won't take long.")
                            .lineLimit(2)
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, 12)
                    .padding(.leading, 30)
                    
                    VStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 15) {
                            CustomTextField(header: "Name",
                                            placeholder: "Enter Name",
                                            text: $viewModel.nameTxt)
                            
                            CustomEmailTextField(header: "Email",
                                                 placeholder: "Enter Email",
                                                 text: $viewModel.emailTxt)
                            
                            CustomPasswordTextField(header: "Enter Password",
                                                    placeholder: "Enter Password",
                                                    text: $viewModel.passwordTxt,
                                                    validatePassword: Validator.validatePassword,
                                                    errorTxt: "Your password is not valid")
                            
                            CustomPasswordTextField(header: "Confirm Password",
                                                    placeholder: "Retype Password",
                                                    text: $viewModel.confirmPassword,
                                                    validatePassword: validateConfirm,
                                                    errorTxt: "Your password is not matching")
                            
                            Button(action: {
                                self.viewModel.isAcceptTerms.toggle()
                            }, label: {
                                HStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color("yellow_txt_color"))
                                        .frame(width: 17, height: 17)
                                        .background(!self.viewModel.isAcceptTerms ? Color.white : Color("yellow_txt_color"))
                                        .cornerRadius(5)
                                    
                                    Text("Accept terms & Condition?")
                                        .foregroundColor(Color("yellow_txt_color"))
                                        .font(.system(size: 11, weight: .regular))
                                }
                            })
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                        
                        RoundedButton(title: "Sign Up", foregroundColor: Color("green_color"), fontSize: 16, image: "arrow_right")
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
                        Text("Already a member?")
                            .foregroundColor(.black)
                            .font(.system(size: 11, weight: .regular))
                        
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Sign in")
                                .foregroundColor(Color("yellow_txt_color"))
                                .font(.system(size: 11, weight: .regular))
                        })
                    }
                    .padding(.top, 40)
                    .padding(.bottom)
                }
            }
            .navigationBarBackButtonHidden()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
