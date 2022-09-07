//
//  HomeLikesView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeLikesView: View {
    // MARK: Operators
    @ObservedObject var viewModel = LikesViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            // Like posts
            ZStack {
                List {
                    ForEach(viewModel.items, id: \.self) { item in
                        PostCell(post: item)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Likes")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            viewModel.apiPostList {
                if viewModel.items.count != 1 {
                    print("HomeLikesView items are \(viewModel.items.count)")
                } else {
                    print("HomeLikesView item is \(viewModel.items.count)")
                }
            }
        }
    }
}

struct HomeLikesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesView()
            .environment(\.locale, .init(identifier: "uz"))
    }
}
