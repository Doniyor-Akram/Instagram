//
//  HomeUploadView.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import SwiftUI

struct HomeUploadView: View {
    
    @Binding var tabSelection: Int
    
    @State private var caption: String = ""
    
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay: Bool = false
    
    @State var showActionSheet: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ZStack {
                        if selectedImage != nil {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                                .scaledToFit()
                            
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
                                    }
                                    .padding()
                                }
                                Spacer()
                            }
                        } else {
                                Button {
                                    self.showActionSheet.toggle()
                                } label: {
                                    Image(systemName: "camera.on.rectangle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                }
                                .actionSheet(isPresented: $showActionSheet, content: actionSheet)
                                .sheet(isPresented: self.$isImagePickerDisplay) {
                                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                                }
                        }
                    }
                    .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                    .background(Color.gray.opacity(0.2))
                    
                    VStack {
                        TextField("Caption", text: $caption)
                            .font(Font.system(size: 17, design: .default))
                            .frame(height: 45)
                        
                        Divider()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                }
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
            return
        }
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

struct HomeUploadView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUploadView(tabSelection: .constant(0))
    }
}
