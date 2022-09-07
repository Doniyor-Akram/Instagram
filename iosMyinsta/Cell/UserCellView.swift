//
//  UserCellView.swift
//  iosMyinsta
//
//  Created by Doniyor on 17/08/22.
//

import SwiftUI

struct UserCellView: View {
    // Operator
    var user: Users
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            // Profile image
            VStack {
                Image("ic_profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 46, height: 46)
                    .padding(.all, 1.5)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Utilits.colorTwo, lineWidth: 2)
            )
            
            // User's name and email
            VStack(alignment: .leading, spacing: 3) {
                Text(user.displayName!)
                    .foregroundColor(.black)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text(user.email!)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .padding(.leading, 15)
            
            Spacer()
            
            // Following button
            Button {
                
            } label: {
                Text("following")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.5))
                    .frame(width: 100, height: 30)
                    .padding(.horizontal, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
        .padding()
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView(user: Users(uid: "1", displayName: "Jonathan Wardorf", email: "john.wardorf@gmail.com"))
            .environment(\.locale, .init(identifier: "uz"))
    }
}
