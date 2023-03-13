//
//  Contact.swift
//  Trinity
//
//  Created by Baskoro on 13/03/23.
//

import Foundation

import Foundation

struct Contact: Codable {
    
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var dob: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case dob = "dob"
    }
    
    init( id: String,firstName: String,lastName: String,email: String,dob: Date){
        self.id = id;
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dob = dob
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if (container.contains(.id)){
            self.id = try container.decode(String.self, forKey: .id)
        }else{
            self.id = UUID().uuidString
        }
        
        if (container.contains(.firstName)){
            self.firstName = try container.decode(String.self, forKey: .firstName)
        }else{
            self.firstName = ""
        }
        
        if (container.contains(.lastName)){
            self.lastName = try container.decode(String.self, forKey: .lastName)
        }else{
            self.lastName = ""
        }
        
        if (container.contains(.email)){
            self.email = try container.decode(String.self, forKey: .email)
        }else{
            self.email = ""
        }
        
        if (container.contains(.dob)){
            let dateString = try container.decode(String.self, forKey: .dob)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd'/'MM'/'yyyy"
            let date = dateFormatter.date(from: dateString)
            self.dob = date ?? Date()
            
        }else{
            self.dob = Date()
        }
    }
}
