//
//  MyPostCellView.swift
//  iosMyinsta
//
//  Created by Doniyor on 17/08/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCellView: View {
    // MARK: Operators
    var post: Post
    var length: CGFloat
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            // Image
            WebImage(url: URL(string: post.imageURL!))
                .resizable()
                .frame(width: length, height: length)
                .scaledToFit()
                .cornerRadius(10)
            
            // Comment
            HStack {
                Text("comment")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .font(.callout)
                    .padding(.leading, 5)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    .lineLimit(5)
                
                Spacer()
            }
        }
    }
}

struct MyPostCellView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostCellView(post: Post(title: "Magnus Gage", content: "August 17, 2022", imageURL: Utilits.image1), length: UIScreen.width)
    }
}
