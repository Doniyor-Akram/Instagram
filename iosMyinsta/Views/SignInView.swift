//
//  SignInView.swift
//  iosMyinsta
//
//  Created by Doniyor on 06/08/22.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background mix color
                LinearGradient(gradient: Gradient(colors: [Utilits.colorOne, Utilits.colorTwo]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                )
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // TextField and SecureField
                    Group {
                        Text("app_name")
                            .font(Font.custom("Billabong", size: 75))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 15)
                        
                        TextField("email", text: $email)
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                        
                        SecureField("password", text: $password)
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                    }
                    
                    // Sign In button
                    Button {
                        // Sign in
                    } label: {
                        HStack{
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
                    
                    // Text and Sign Up button on bottom
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
                    .frame(maxWidth: .infinity, maxHeight: 65)
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .accentColor(.white)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
