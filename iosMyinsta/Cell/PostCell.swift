//
//  PostCell.swift
//  iosMyinsta
//
//  Created by Doniyor on 16/08/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    var post: Post
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack {
                    Image("ic_profile") // Profile image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                        .padding(.all, 2)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Utilits.colorTwo, lineWidth: 2)
                )
                
                // Name and Date
                VStack(alignment: .leading, spacing: 3) {
                    Text(post.title!) // User's name
                        .font(.headline)
                        .fontWeight(.semibold)
                        
                    Text(post.content!) // Date of post
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                // More button
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.callout)
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
            
            // MARK: Image
            WebImage(url: URL(string: post.imageURL!))
                .resizable()
                .scaledToFit()
                .padding(.top, 15)
            
            // Like, Share buttons and Comments
            HStack(spacing: 15) {
                
                // Like button
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.body)
                        .foregroundColor(.black)
                }
                
                // Share button
                Button {
                    
                } label: {
                    Image("ic_share")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFit()
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
            
            // MARK: Comments field
            HStack {
                Text("comment")
                    .multilineTextAlignment(.leading)
                    .font(.callout)
                Spacer()
            }
            .padding()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(title: "Martin Taylor", content: "July 7, 2022", imageURL: Utilits.image1))
            .environment(\.locale, .init(identifier: "uz"))
            
    }
}
