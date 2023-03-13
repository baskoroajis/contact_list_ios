//
//  ContactDetail.swift
//  Trinity
//
//  Created by Baskoro on 13/03/23.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var contactViewModel = ContactViewModel.shared
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                
                Form {
                    Image("avatar")
                    
                    Section("Main Information") {
                        TextField("First Name", text: $contactViewModel.contactDetail.firstName)
                        TextField("Last Name", text:  $contactViewModel.contactDetail.lastName)
                    }
                    
                    Section("Sub Information") {
                        TextField("Email", text: $contactViewModel.contactDetail.email).keyboardType(.emailAddress)
                        DatePicker(selection: $contactViewModel.contactDetail.dob, in: ...Date(), displayedComponents: [.date]) {
                            Text("DOB")
                        }
                    }
                }
                
            }
            .navigationTitle(contactViewModel.contactDetail.firstName + " " + contactViewModel.contactDetail.lastName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button("Save", action: {contactViewModel.saveItemByid()})
                    .alert(isPresented:$contactViewModel.isShowSuccessSaveAlert){
                        Alert(
                           title: Text("Success"),
                           message: Text("Your Contact Successfully Updated"),
                           dismissButton: .default(Text("OK")) {
                               self.presentationMode.wrappedValue.dismiss()
                           }
                       )
                    }
            )

        }
        
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView()
    }
}
