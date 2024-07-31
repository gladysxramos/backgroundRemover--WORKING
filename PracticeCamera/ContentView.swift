//
//  ContentView.swift
//  PracticeCamera
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var processedImage: UIImage?
    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage(named: "camera")!)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0, height: 200.0)
            
            HStack{
                Button {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                    
                }label: {
                    Text("Select a photo")
                }
                Button {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                } label: {
                    Text("Take a photo")
                }

                .padding()
            }
            Button("Remove Background") {
                testBackgroundRemoval()
//                if let image = selectedImage {
//                    print("Selected image available")
//                    let backgroundRemoved = image.removeBackground(returnResult: .finalImage)
//                    print("background removal complere")
//                    processedImage = backgroundRemoved
//                } else {
//                    print("No selected image")
//                }
     
            }
            
        }
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        }
    }
    func testBackgroundRemoval() {
        if let image = selectedImage {
            print("Testing background removal...")
            let backgroundRemoved = image.removeBackground(returnResult: .finalImage)
            if let resultImage = backgroundRemoved {
                selectedImage = resultImage
                
                print("Background removal succeeded")
            } else {
                print("Background removal failed")
            }
        } else {
            print("No image selected for removal")
        }
    }
}






#Preview {
    ContentView()
}
