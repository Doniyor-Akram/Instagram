//
//  HomeView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeFeedView(tabSelection: $tabSelection)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            HomeSearchView()
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            HomeUploadView(tabSelection: $tabSelection)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "camera")
                }.tag(2)
            
            HomeLikesView()
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            HomeProfileView(level: 2)
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .tint(Utilits.colorTwo)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
