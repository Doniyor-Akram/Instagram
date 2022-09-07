//
//  SearchViewModel.swift
//  iosMyinsta
//
//  Created by Doniyor on 17/08/22.
//

import Foundation

class  SearchViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var items: [Users] = []
    
    func apiUserList(completion: @escaping () -> Void) {
        isLoading = true
        items.removeAll()
        
        self.items.append(Users.init(uid: "1", displayName: "Craig Davison", email: "craig@gmail.com"))
        self.items.append(Users.init(uid: "2", displayName: "Pamela Davison", email: "pamela@gmail.com"))
        self.items.append(Users.init(uid: "3", displayName: "Anrey Petrov", email: "andrey@gmail.com"))
        self.items.append(Users.init(uid: "4", displayName: "Anna Kovalev", email: "anna@gmail.com"))
        self.items.append(Users.init(uid: "5", displayName: "Peter Joel", email: "peter@gmail.com"))
        self.items.append(Users.init(uid: "6", displayName: "Li Ceon", email: "liceon@gmail.com"))
        self.items.append(Users.init(uid: "7", displayName: "Guli Akbarova", email: "guliguli@gmail.com"))
        self.items.append(Users.init(uid: "8", displayName: "Abigael Rosato", email: "rosato@gmail.com"))
        self.items.append(Users.init(uid: "9", displayName: "Luis Hermes", email: "luis.hermes@gmail.com"))
        
        isLoading = false
        completion()
    }
}
