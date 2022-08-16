//
//  HomeFeedView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeFeedView: View {
    
    @Binding var tabSelection: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                
            }
            .navigationTitle("Home")
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
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView(tabSelection: .constant(0))
    }
}
