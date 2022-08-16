//
//  LikesViewModel.swift
//  iosMyinsta
//
//  Created by Doniyor on 16/08/22.
//

import Foundation

class LikesViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var items: [Post] =  []
    
    func apiPostList(completion: @escaping () -> ()) {
        isLoading = true
        items.removeAll()
        
        self.items.append(Post(title: "Adam Smiths", content: "August 16, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Lana Frade", content: "August 2, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Bill Jone", content: "August 5, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Caeser Crood", content: "August 4, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Daniel Rock", content: "August 10, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Robert Li", content: "August 1, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Andrey Petrov", content: "August 16, 2022", imageURL: Utilits.image1))
        
        isLoading = false
        completion()
    }
}
