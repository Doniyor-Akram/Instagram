//
//  HomeProfileView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeProfileView: View {
    // MARK: Operators
    @ObservedObject var viewModel = ProfileViewModel()
    @State private var email: String = "winston.cross@gmail.com"
    @State var showActionSheet: Bool = false
    
    // Operators of Profile image
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay: Bool = false
    
    //Operators of Scroll View
    @State var level: Int
    @State var change: Bool = false
    
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
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // MARK: Profile image
                Group {
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
                            
                            // MARK: Plus button
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
                            // MARK: By default image
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
                            // MARK: Plus button
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
                }
                
                Group {
                    // MARK: Profile name
                    VStack {
                        Text("Winston Cross")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.top, 15)
                        
                        Text(email)
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        // MARK: Statistics
                        HStack {
                            // Posts count
                            VStack {
                                Text("782")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("posts")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: UIScreen.width / 3, maxHeight: 60)
                            
                            // Vertical divider
                            VStack {
                            }
                            .frame(maxWidth: 1, maxHeight: 25)
                            .background(Color.gray.opacity(0.5))
                            
                            // MARK: Followers count
                            VStack {
                                Text("8,326")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("followers")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: UIScreen.width / 3, maxHeight: 60)
                            
                            // Vertical divider
                            VStack {
                            }
                            .frame(maxWidth: 1, maxHeight: 25)
                            .background(Color.gray.opacity(0.5))
                            
                            // MARK: Following count
                            VStack {
                                Text("13")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text("following")
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
                        self.level = 1
                        self.change = true
                    } label: {
                        Image("ic_splitscreen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width / 3, height: 20)
                            .foregroundColor(Utilits.colorTwo)
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 5, y: 5)
                    }
                    
                    // MARK: Second button
                    Button {
                        self.level = 2
                        self.change = true
                    } label: {
                        Image("ic_grid")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width / 3, height: 20)
                            .foregroundColor(Utilits.colorTwo)
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 5, y: 5)
                    }
                    
                    // MARK: Third button
                    Button {
                        self.level = 3
                        self.change = true
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
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: change ? postGrid() : columnsTwo, spacing: 0) {
                        ForEach(viewModel.items, id: \.self) { item in
                            MyPostCellView(post: item, length: posSize())
                        }
                    }
                }
                .cornerRadius(10)
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
        // MARK: onAppear
        .onAppear() {
            viewModel.apiPostList {
                if viewModel.items.count != 1 {
                    print("HomeProfileView items are \(viewModel.items.count)")
                } else {
                    print("HomeProfileView item is \(viewModel.items.count)")
                }
            }
        }
    }
    
    // MARK: Post size method
    func posSize() -> CGFloat {
        var widthSize: CGFloat? = nil
        
        switch level {
        case 1:
            widthSize = UIScreen.width / CGFloat(level) - 6
        case 2:
            widthSize = UIScreen.width / CGFloat(level) - 5
        case 3:
            widthSize = UIScreen.width / CGFloat(level) - 5
        default:
            print("Wrong number!")
        }
        
        return widthSize!
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
        let pickPhoto: ActionSheet.Button = .default(Text("pick_photo")) {
            self.sourceType = .photoLibrary
            self.isImagePickerDisplay.toggle()
        }
        
        let takePhoto: ActionSheet.Button = .default(Text("take_photo")) {
            self.sourceType = .camera
            self.isImagePickerDisplay.toggle()
        }
        
        let cancel: ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text("choice"),
            message: Text("select_one"),
            buttons: [pickPhoto, takePhoto, cancel]
        )
    }
}


struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView(level: 2)
    }
}
