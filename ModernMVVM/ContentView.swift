//
//  ContentView.swift
//  ModernMVVM
//
//  Created by Vadym Bulavin on 3/12/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    @State var password = ""
    @State var repeatedPassword = ""
    @State var usernameIsValid = true
    @State var passwordIsValid = true
    @State var repeatedPasswordIsValid = true
    @State var isLoading = false
    @State var isShowingError = false
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .modifier(Validated(isValid: $usernameIsValid))
            
            TextField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .modifier(Validated(isValid: $usernameIsValid))
            
            TextField("Repeat Password", text: $repeatedPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .modifier(Validated(isValid: $usernameIsValid))
            
            Button(action: self.onSignUp) { Text("Sign Up") }
            
            Button(action: self.onLogin) { Text("Already have an account") }
        }
        .padding()
        .alert(isPresented: $isShowingError) {
            Alert(
                title: Text("Unexpected error occurred"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func onSignUp() {
        
    }
    
    func onLogin() {
        
    }
}

struct Validated: ViewModifier {
    @Binding var isValid: Bool

    func body(content: Content) -> some View {
        Group {
            if isValid {
                content.border(Color.red)
            } else {
                content
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
