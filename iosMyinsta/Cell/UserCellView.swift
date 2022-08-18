//
//  UserCellView.swift
//  iosMyinsta
//
//  Created by Doniyor on 17/08/22.
//

import SwiftUI

struct UserCellView: View {
    var user: Users
    
    var body: some View {
        HStack(spacing: 0) {
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
            
            Button {
                
            } label: {
                Text("Following")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.5))
                    .frame(width: 90, height: 30)
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
    }
}
