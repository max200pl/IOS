//
//  AddNewListView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import SwiftUI

struct AddNewListView: View {
    @ObservedObject private var vm: AddNewListViewModel // подписываемя на изменения
    
    @Environment(\.presentationMode) var presentationMode // это диалог
    
    init(vm: AddNewListViewModel) { // передаем в конструктор класс при создании и называем vm
        self.vm = vm
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("New List")
                    .font(.title)
                    .padding(.bottom, 20)
                
                HStack() {
                    Text("Name:")
                    TextField("", text: $vm.name)
                }
                
                HStack {
                    Text("Color:")
                    ColorListView(selectedColor: $vm.color)
                }
            }
            
            HStack {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                Button("Ok"){
                    vm.save()
                    presentationMode.wrappedValue.dismiss()
                }.disabled(vm.name.isEmpty)
            }
        }.frame(minWidth: 300)
            .padding()
    }
}

#Preview {
    let viewContex = CoreDataManager.shared.persistentContainer.viewContext
    AddNewListView(vm: AddNewListViewModel(context: viewContex))
}
