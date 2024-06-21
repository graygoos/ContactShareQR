//
//  HomeScreen.swift
//  ContactShareQR
//
//  Created by Femi Aliu on 20/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var contactStore = ContactStore()
    @StateObject private var userProfile = UserProfile()
    @State private var isFirstLaunch = true
    @State private var scannedContact: Contact? = nil
    @State private var contacts: [Contact] = []
    @State private var searchQuery: String = ""
    @State private var sortOption: SortOption = .predefined
    @State private var showingView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("John Smith")
                        .font(.title)
                        .padding()
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                    }
                    .padding()
                    Button(action: {}) {
                        Image(systemName: "message")
                    }
                    .padding()
                }
                HStack {
                    Text("Contacts")
                        .font(.headline)
                    Spacer()
                    Picker("Sort", selection: $sortOption) {
                        Text("Predefined").tag(SortOption.predefined)
                        Text("Most Recent").tag(SortOption.mostRecent)
                        Text("Least Recent").tag(SortOption.leastRecent)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                
                List {
                    ForEach(filteredAndSortedContacts) { contact in
                        NavigationLink(destination: ContactDetailView(contact: contact)) {
                            ContactRowView(contact: contact)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button(action: {
                    // Action to add a new contact
                    showingView.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .padding()
                }
                .sheet(isPresented: $showingView, content: {
                    AddContactView()
                })
            }
            .navigationBarHidden(true)
            .onAppear {
                if isFirstLaunch {
                    showingView = true
                }
            }
        }
    }
    
    var filteredAndSortedContacts: [Contact] {
        // Filtering and sorting logic here
        return contacts
    }
    
    
    enum SortOption {
        case predefined, mostRecent, leastRecent
    }
}
    
#Preview {
    HomeScreen()
}


/*
 import contacts upon first launch?
 
 */
