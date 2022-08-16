//
//  HomeFeedView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeFeedView: View {
    
    @Binding var tabSelection: Int
    @ObservedObject var viewModel = FeedViewModel()
    
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
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.tabSelection = 2
                    } label: {
                        Image(systemName: "camera")
                    }
                }
            }
        }
        .onAppear() {
            viewModel.apiPostList {
                print(viewModel.items.count)
            }
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView(tabSelection: .constant(0))
    }
}
