//
//  SignUpView.swift
//  iosMyinsta
//
//  Created by Doniyor on 06/08/22.
//

import SwiftUI

struct SignUpView: View {
    // MARK: Operators
    @Environment(\.presentationMode) var presentationMode
    
    @State private var fullname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
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
                        
                        TextField("fullname", text: $fullname) // Fullname
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                        
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
                        
                        SecureField("cpassword", text: $confirmPassword) // Confirm password
                            .frame(height: 45)
                            .padding(.leading, 10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(8)
                    }
                    
                    // Sign Up button
                    Button {
                        // Sign up
                    } label: {
                        HStack{
                            Spacer()
                            Text("sign_up")
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
                            Text("already_have_account")
                                .foregroundColor(.white)
                            
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("sign_in")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
