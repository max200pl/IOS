//
//  HomeScreen.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var body: some View {
        NavigationView {
           let myListVM = MyListsViewModel(context: context)
            let firstListVM = myListVM.myLists.first
            
           SideBarView()
                .frame(minWidth: 200)
            
            
           if let firstListVM = firstListVM {
               MyListItemsHeader(name: firstListVM.name, count: firstListVM.itemsCount, color: firstListVM.color)
               
               MyListItemsView(items: firstListVM.items)
            }
            
        }
    }
}

#Preview {
    HomeScreen()
}
