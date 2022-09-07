//
//  SignInView.swift
//  iosMyinsta
//
//  Created by Doniyor on 06/08/22.
//

import SwiftUI

struct SignInView: View {
    // MARK: Operators
    @State private var email: String = ""
    @State private var password: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                // Background mix colors
                LinearGradient(
                    gradient: Gradient(colors: [Utilits.colorOne, Utilits.colorTwo]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // TextField and SecureField
                    Group {
                        Text("app_name") // Instagram Logo
                            .font(Font.custom("Billabong", size: 75))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 15)
                        
                        TextField("email", text: $email) // Email
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                        
                        SecureField("password", text: $password) // Password
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                    }
                    
                    // Sign In button
                    Button {
                        // Sign in
                    } label: {
                        HStack {
                            Spacer()
                            Text("sign_in")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .frame(height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1.5)
                        )
                        .foregroundColor(.white)
                        .padding([.horizontal, .top], 1)
                    }
                    
                    Spacer()
                    
                    // Bottom content: Text and Sign Up button
                    VStack {
                        HStack {
                            Text("dont_have_account")
                                .foregroundColor(.white)
                            NavigationLink {
                                SignUpView()
                            } label: {
                                Text("sign_up")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 65) // Frame bottom content
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .accentColor(.white) // Back button color
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
