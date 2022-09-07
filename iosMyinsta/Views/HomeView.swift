//
//  HomeView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: Operators
    @State private var tabSelection: Int = 0
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $tabSelection) {
            // First tab item
            HomeFeedView(tabSelection: $tabSelection)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            // Second tab item
            HomeSearchView()
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            // Third tab item
            HomeUploadView(tabSelection: $tabSelection)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "camera")
                }.tag(2)
            
            // Fourth tab item
            HomeLikesView()
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            // Fiveth tab item
            HomeProfileView(level: 2)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(Utilits.colorTwo)
//        .tint(Utilits.colorTwo)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.locale, .init(identifier: "uz"))
    }
}
