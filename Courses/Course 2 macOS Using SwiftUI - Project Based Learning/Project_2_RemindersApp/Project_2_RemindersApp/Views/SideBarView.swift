//
//  SideBarView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import SwiftUI

struct SideBarView: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("Al ites Count 10")
            
            MyListsView(vm: MyListsViewModel(context: context))
            
            Spacer()
            
            Button {
                isPresented = true
            } label:{
                HStack {
                    Image(systemName: Constants.Icons.plusCircle)
                    Text("Add List")
                }
            }.buttonStyle(.plain)
                .padding(.horizontal)
        }.sheet(isPresented: $isPresented, content: {
            AddNewListView(vm: AddNewListViewModel(context: context))
        })
    }
}

#Preview {
    
    SideBarView()
}
