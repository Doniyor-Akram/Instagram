//
//  HomeLikesView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeLikesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
            }
            .navigationTitle("Likes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                    }
                }
            }
        }
    }
}

struct HomeLikesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesView()
    }
}
