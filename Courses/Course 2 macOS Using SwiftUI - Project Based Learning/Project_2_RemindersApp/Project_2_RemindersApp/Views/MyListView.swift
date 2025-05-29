//
//  MyListView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 29.05.2025.
//

import SwiftUI

struct MyListsView: View {
    @StateObject var vm: MyListsViewModel
    
    init(vm: MyListsViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            List {
                Text("My Lists")
                
                ForEach(vm.myLists) { list in
                    HStack {
                        Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                            .font(.title)
                            .foregroundColor(list.color)
                        Text(list.name)
                    }.contextMenu {
                        Button {
                            vm.delete(list)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let viewContex = CoreDataManager.shared.persistentContainer.viewContext
    
    MyListsView(vm: MyListsViewModel(context:viewContex))
}
