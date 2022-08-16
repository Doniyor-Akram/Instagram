//
//  HomeLikesView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeLikesView: View {
    
    @ObservedObject var viewModel = LikesViewModel()
    
    var body: some View {
        NavigationView {
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
                print(viewModel.items.count)
            }
        }
    }
}

struct HomeLikesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesView()
    }
}
