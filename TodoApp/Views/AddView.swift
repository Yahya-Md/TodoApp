//
//  AddView.swift
//  TodoApp
//
//  Created by macOs on 3/12/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentionMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: save, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity )
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })

                
            }.padding(15)
        }
        .navigationTitle("Add an item:")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func save() {
        if textLengthCheck() {
        listViewModel.addItem(title: textFieldText)
        presentionMode.wrappedValue.dismiss()
            
        }
    }
    
    func textLengthCheck() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title can't be less than 3 character"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
