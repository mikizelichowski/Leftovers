//
//  SignUpViewModel.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

@MainActor
final class SignUpViewModel: ObservableObject {
    
    @Published var emailTxt: String = ""
    @Published var passwordTxt: String = ""
    @Published var nameTxt: String = ""
    @Published var confirmPassword: String = ""
    @Published var isAcceptTerms: Bool = false
}
