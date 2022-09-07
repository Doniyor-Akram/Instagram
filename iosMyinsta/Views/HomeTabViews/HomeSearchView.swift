//
//  HomeSearchView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeSearchView: View {
    // MARK: Operators
    @ObservedObject var viewModel = SearchViewModel()
    @State private var keyword: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Search textfield
                    HStack {
                        TextField("search_for_users", text: $keyword)
                            .padding(.leading, 15)
                            .frame(height: 45)
                            .font(.callout)
                        
                        Spacer()
                        
                        // Magnifier button
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
                    .padding(.all, 20)
                    
                    // List of followings
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
                if viewModel.items.count != 1 {
                    print("HomeSearchView items are \(viewModel.items.count)")
                } else {
                    print("HomeSearchView item is \(viewModel.items.count)")
                }
            }
        }
    }
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView()
            .environment(\.locale, .init(identifier: "uz"))
    }
}
