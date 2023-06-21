//
//  AddPersonView.swift
//  iRemember
//
//  Created by Matheus Viana on 24/05/23.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss

    @State var name: String = ""
    @State var inputImage: UIImage?
    @State var image: Image?
    @State private var isShowingPicker = false
    
    var body: some View {
        Form {
            Section {
                TextField("What's their name?", text: $name)
            }
            
            Section {
                Button("How's their face") {
                    isShowingPicker = true
                }
            }
            
            if name.count > 0 && image != nil {
                Section {
                    Text("Name to be reminded \(name)")
                    image?
                        .resizable()
                        .scaledToFit()
                    
                    Button("Add") {
                        save()
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingPicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let addedImage = inputImage else {
            return
        }
        
        image = Image(uiImage: addedImage)
    }
    
    func save() {
        guard let imageToBeSaved = inputImage else {
            return
        }
        
        let imgSaver = ImageSaver()
        
        imgSaver.successHandler = {
            print("Success!")
        }
        
        imgSaver.errorHandler = {
            print("Ooops! \($0.localizedDescription)")
        }
        
        imgSaver.writeData(image: imageToBeSaved, personName: name)
        dismiss()
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static let person = Person.generateStaticData()
    static var previews: some View {
        AddPersonView(name: person.name, inputImage: person.uiImage)
    }
}
