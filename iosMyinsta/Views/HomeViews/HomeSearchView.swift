//
//  HomeSearchView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeSearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State private var keyword: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        TextField("search_for_users", text: $keyword)
                            .padding(.leading, 15)
                            .frame(height: 45)
                            .font(.callout)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.5), lineWidth: 0.5)
                    )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    
                    List {
                        ForEach(viewModel.items, id: \.self) { item in
                            UserCellView(user: item)
                                .listRowInsets(EdgeInsets())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            viewModel.apiUserList {
                print(viewModel.items.count)
            }
        }
    }
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView()
    }
}
