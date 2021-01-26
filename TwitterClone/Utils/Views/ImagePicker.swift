//
//  ImagePicker.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 25/01/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode)var mode
    
    func makeCoordinator() -> Coordinator {
        
        Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

extension ImagePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parents: ImagePicker
        
        init(_ parents: ImagePicker) {
            self.parents = parents
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
            guard let image = info[.originalImage] as? UIImage else { return }
            
            parents.image = image
            parents.mode.wrappedValue.dismiss()
        }
    }
}
