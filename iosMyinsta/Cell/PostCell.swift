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
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack {
                    Image("ic_profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                        .padding(.all, 2)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Utilits.colorTwo, lineWidth: 2)
                )
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(post.title!)
                        .font(.headline)
                        .fontWeight(.semibold)
                        
                    Text(post.content!)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.callout)
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
            
            WebImage(url: URL(string: post.imageURL!))
                .resizable()
                .scaledToFit()
                .padding(.top, 15)
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.body)
                        .foregroundColor(.black)
                }

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
            
            HStack {
                Text("Catch up on the Black Founders digital accelerator program for high potential Seed to Series A tech startups and prepare for the next opening.")
                    .multilineTextAlignment(.leading)
                    .font(.caption)
            }
            .padding()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(title: "Martin Taylor", content: "July 7, 2022", imageURL: Utilits.image1))
    }
}
