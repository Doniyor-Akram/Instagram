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
                LinearGradient(gradient: Gradient(colors: [Utilits.colorOne, Utilits.colorTwo]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                )
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // TextField and SecureField
                    Group {
                        Text("Instagram")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        TextField("Email", text: $email)
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                        
                        SecureField("Password", text: $password)
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
                            Text("Sign In")
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
                            Text("Don't have an account?")
                                .foregroundColor(.white)
                            NavigationLink {
                                SignUpView()
                            } label: {
                                Text("Sign Up")
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
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
