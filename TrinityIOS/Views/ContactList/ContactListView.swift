//
//  ContactList.swift
//  Trinity
//
//  Created by Baskoro on 13/03/23.
//

import SwiftUI

struct ContactListView: View {
    
    @ObservedObject var contactViewModel = ContactViewModel.shared
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                
                LazyVGrid(columns: gridItemLayout, spacing: 20){
                    ForEach(contactViewModel.contacs ?? [], id: \.id) { contact in
                        ContactListItemView(contact:contact)
                    }
                }
                .padding([.horizontal], 20)
                
            }
            .navigationTitle("Contact List")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
            .navigationBarItems(
                leading:
                    Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                }),
                trailing:
                   Button(action: {}, label: {
                       Image(systemName: "plus")
                   })
            )
            
        }
        .onAppear {
            contactViewModel.loadContactDataFromJSONfile()
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}


