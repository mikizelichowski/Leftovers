//
//  SignInViewModel.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 20/10/2023.
//

import SwiftUI

enum FocusedField {
    case email
    case password
}

@MainActor
final class SignInViewModel: ObservableObject {
    
    @Published var emailTxt: String = ""
    @Published var passwordTxt: String = ""
}
