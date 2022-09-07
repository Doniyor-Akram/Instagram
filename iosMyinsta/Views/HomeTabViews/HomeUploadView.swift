//
//  HomeUploadView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeUploadView: View {
    // MARK: Operators
    @Binding var tabSelection: Int
    @State var showActionSheet: Bool = false
    @State private var caption: String = ""
    
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay: Bool = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                // Image field
                ZStack {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                            .scaledToFit()
                        
                        // Cancel button
                        VStack {
                            HStack {
                                Spacer()
                                
                                Button {
                                    selectedImage = nil
                                } label: {
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .scaledToFit()
                                        .foregroundColor(Utilits.colorTwo)
                                }
                                .padding()
                                .padding(.trailing, 3)
                            }
                            Spacer()
                        }
                    } else {
                        // Camera button
                        Button {
                            self.showActionSheet.toggle()
                        } label: {
                            Image(systemName: "camera.on.rectangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Utilits.colorTwo)
                                .shadow(color: .black.opacity(0.4), radius: 8, y: 8)
                        }
                        .actionSheet(isPresented: $showActionSheet, content: actionSheet)
                        .sheet(isPresented: self.$isImagePickerDisplay) {
                            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                        }
                    }
                }
                .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width) // Image frame
                .background(Color.gray.opacity(0.2)) // By default background color
                
                // Caption textfield
                VStack {
                    TextField("caption", text: $caption)
                        .font(Font.system(size: 17, design: .default))
                        .frame(height: 45)
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                Spacer()
            }
            .navigationTitle("Upload")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.tabSelection = 0
                        self.uploadPost()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
    
    // MARK: Upload method
    func uploadPost() {
        if caption.isEmpty || selectedImage == nil {
            return // Rasm va Sarlavha yozilmaguncha, yuklash amalga oshmaydi
        }
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

struct HomeUploadView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUploadView(tabSelection: .constant(0))
            .environment(\.locale, .init(identifier: "uz"))
    }
}
