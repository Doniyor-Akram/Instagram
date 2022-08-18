//
//  HomeProfileView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State private var email: String = "winston.cross@gmail.com"
    
    // Operators of Profile image
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay: Bool = false
    
    @State var showActionSheet: Bool = false
    
    //Operators of Scroll View
    @State var level: Int
    @State var change: Bool = true
    
    @State var columnsOne: [GridItem] = [
        GridItem.init(.flexible(minimum: UIScreen.width), spacing: nil, alignment: nil)
    ]
    
    @State var columnsTwo: [GridItem] = [
        GridItem.init(.flexible(minimum: UIScreen.width / 2), spacing: -2, alignment: nil),
        GridItem.init(.flexible(minimum: UIScreen.width / 2), spacing: -2, alignment: nil)
    ]
    
    @State var columnsThree: [GridItem] = [
        GridItem.init(.flexible(minimum: UIScreen.width / 3), spacing: -2, alignment: nil),
        GridItem.init(.flexible(minimum: UIScreen.width / 3), spacing: -2, alignment: nil),
        GridItem.init(.flexible(minimum: UIScreen.width / 3), spacing: -2, alignment: nil)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // MARK: Profile image and plus button
                ZStack(alignment: .bottomTrailing) {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 75, height: 75)
                            .padding(.all, 2)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Utilits.colorTwo, lineWidth: 1.5)
                            )
                        
                        Button {
                            self.showActionSheet.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .background(
                                    Circle()
                                        .foregroundColor(.white)
                                )
                        }
                        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
                        .sheet(isPresented: self.$isImagePickerDisplay) {
                            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                        }
                    } else {
                        Image("ic_profile")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 75, height: 75)
                            .padding(.all, 2)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Utilits.colorTwo, lineWidth: 1.5)
                            )
                        
                        Button {
                            self.showActionSheet.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .background(
                                    Circle()
                                        .foregroundColor(.white)
                                )
                        }
                        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
                        .sheet(isPresented: self.$isImagePickerDisplay) {
                            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                        }
                    }
                }
                
                // MARK: Profile name, email and Statistics
                Group {
                    VStack {
                        Text("Winston Cross")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.top, 15)
                        
                        Text(email)
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        // Statistics
                        HStack {
                            VStack {
                                Text("782")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("Posts")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: UIScreen.width / 3, maxHeight: 60)
                            
                            VStack {
                            }
                            .frame(maxWidth: 1, maxHeight: 25)
                            .background(Color.gray.opacity(0.5))
                            
                            
                            VStack {
                                Text("8,326")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("Followers")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: UIScreen.width / 3, maxHeight: 60)
                            
                            VStack {
                            }
                            .frame(maxWidth: 1, maxHeight: 25)
                            .background(Color.gray.opacity(0.5))
                            
                            VStack {
                                Text("13")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("Following")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: UIScreen.width / 3, maxHeight: 60)
                        }
                        .padding(.top, 15)
                    }
                }
                
                // MARK: Grid buttons
                HStack {
                    // First button
                    Button {
                        self.change.toggle()
                        self.level = 1
                    } label: {
                        Image("ic_splitscreen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width / 3, height: 20)
                            .foregroundColor(Utilits.colorTwo)
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 5, y: 5)
                    }
                    
                    // Second button
                    Button {
                        self.change.toggle()
                        self.level = 2
                    } label: {
                        Image("ic_grid")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width / 3, height: 20)
                            .foregroundColor(Utilits.colorTwo)
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 5, y: 5)
                    }
                    
                    // Third button
                    Button {
                        self.change.toggle()
                        self.level = 3
                    } label: {
                        Image("ic_gridThree")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width / 3, height: 20)
                            .foregroundColor(Utilits.colorTwo)
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 5, y: 5)
                    }
                }
                .padding(.all, 10)
                
                // MARK: ScrollView
                ScrollView {
                    LazyVGrid(columns: change ? columnsTwo : postGrid(), spacing: 0) {
                        ForEach(viewModel.items, id: \.self) { item in
                            MyPostCellView(post: item, length: postSize())
                        }
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "pip.exit")
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
    
    // MARK: Post size method
    func postSize() -> CGFloat {
        if level == 1 {
            return UIScreen.width / CGFloat(level) - 6
        } else if level == 2 {
            return UIScreen.width / CGFloat(level) - 5
        }
        return UIScreen.width / CGFloat(level) - 5
    }
    
    // MARK: Grid size method
    func postGrid() -> [GridItem] {
        var result: [GridItem]? = nil
        
        switch level {
        case 1:
            result = columnsOne
        case 2:
            result = columnsTwo
        case 3:
            result = columnsThree
        default:
            print("Wrong column!")
        }
        return result!
    }
    
    // MARK: ActionSheet method
    func actionSheet() -> ActionSheet {
        let title: String = "Выбор"
        let message: String = "Выберите один из следующих:"
        
        let pickPhoto: ActionSheet.Button = .default(Text("Pick Photo")) {
            self.sourceType = .photoLibrary
            self.isImagePickerDisplay.toggle()
        }
        
        let takePhoto: ActionSheet.Button = .default(Text("Take Photo")) {
            self.sourceType = .camera
            self.isImagePickerDisplay.toggle()
        }
        
        let cancel: ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text(title),
            message: Text(message),
            buttons: [pickPhoto, takePhoto, cancel]
        )
    }
}


struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView(level: 2)
    }
}
