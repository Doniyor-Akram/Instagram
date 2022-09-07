//
//  ProfileViewModel.swift
//  iosMyinsta
//
//  Created by Doniyor on 17/08/22.
//

import Foundation
 
class ProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var items: [Post] = []
    
    func apiPostList(completion: @escaping () -> Void) {
        isLoading = true
        items.removeAll()
        
        self.items.append(Post(title: "Akbar Umarov", content: "August 14, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Michael Ubaru", content: "August 2, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Lola Rasulova", content: "August 4, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Jony Vines", content: "August 5, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Aleksey Nikitin", content: "August 3, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Barbara Scott", content: "August 10, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Hegtor Aaron", content: "August 7, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Huang Chung", content: "August 8, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Barbara Scott", content: "August 10, 2022", imageURL: Utilits.image1))
        self.items.append(Post(title: "Hegtor Aaron", content: "August 7, 2022", imageURL: Utilits.image2))
        self.items.append(Post(title: "Huang Chung", content: "August 8, 2022", imageURL: Utilits.image1))
        
        isLoading = false
        completion()
    }
}
