//
//  ContactStore.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import Foundation

class ContactStore: ObservableObject {
    @Published var contacts: [Contact] = []
    
    init() {
        loadContacts()
    }
    
    func loadContacts() {
        // Load contacts from storage
    }
    
    func saveContacts() {
        // Save contacts to storage
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
        saveContacts()
    }
}
