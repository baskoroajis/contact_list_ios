//
//  ContactListItem.swift
//  Trinity
//
//  Created by Baskoro on 13/03/23.
//

import SwiftUI

struct ContactListItemView: View {
   
    @ObservedObject var contactViewModel = ContactViewModel.shared
    
    let contact:Contact
    
    var fullname:  String  {
        return contact.firstName + " " + contact.lastName
    }

    var body: some View {
        VStack{
            
            NavigationLink( destination:ContactDetailView(), label: {
                
                VStack{
                    Image("avatar").resizable().frame(width: 50, height: 50)
                    Text(fullname).foregroundColor(.black)
                    Divider()
                }
                   
                
                }
        
            ).simultaneousGesture(TapGesture().onEnded{
                contactViewModel.contactDetail = contact
            })
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .leading
            )
      
    }
}

struct ContactListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContactListItemView(contact: Contact(id: "", firstName: "Baskoro", lastName: "Aji", email: "", dob: Date()))
    }
}
