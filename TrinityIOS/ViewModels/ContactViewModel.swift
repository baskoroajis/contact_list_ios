//
//  ContactViewModel.swift
//  Trinity
//
//  Created by Baskoro on 13/03/23.
//

import Foundation


class ContactViewModel: ObservableObject{
    static let shared: ContactViewModel = ContactViewModel(contacs: nil, contactDetail: Contact(id: "", firstName: "", lastName: "", email: "", dob: Date()))
    
    @Published var contacs:[Contact]?
    @Published var contactDetail:Contact
    
    @Published var isShowSuccessSaveAlert:Bool = false
    
    
    init(contacs: [Contact]? = nil, contactDetail: Contact) {
        self.contacs = contacs
        self.contactDetail = contactDetail
    }
    
    func loadContactDataFromJSONfile () {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = NSData(contentsOf: url)
            
            if let data = jsonData {
                let contacts = try JSONDecoder().decode([Contact].self, from: data as Data)
                self.contacs = contacts.sorted(by: {$0.firstName < $1.firstName})
            }
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    func saveItemByid () {
        if let row = contacs?.firstIndex(where: {$0.id == contactDetail.id}){
            contacs?[row] = contactDetail
            isShowSuccessSaveAlert = true;
        }
    }
    
}
