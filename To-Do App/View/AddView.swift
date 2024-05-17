//
//  AddView.swift
//  To-Do App
//
//  Created by elluminati on 14/05/24.
//

import SwiftUI

struct AddView: View {
    
//    @Environment (\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var textFieldText:String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
    ScrollView{
        VStack {
                TextField("Type something Here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .cornerRadius(15)
            
            Button(action: {
                saveButtonPressed()
                }, label:{
                    Text("Save".uppercased())
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✍🏻")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveButtonPressed(){
        if textAppropriate() == true{
            listViewModel.addItem(title: textFieldText)
//            presentationMode.wrappedValue.dismiss()
            dismiss.callAsFunction()
        }
        
    }
    
    func textAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item is must be greater than 3 characters long!!! 🥱"
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title:  Text(alertTitle)  )
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
