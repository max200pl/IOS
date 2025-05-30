//
//  AddNewListItemView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import SwiftUI

struct AddNewListItemView: View {
    @State private var title: String = ""
    @State private var dueDate: DueDate?
    
    var onSave: (String, Date?) -> Void
    
    var body: some View {
      
        HStack(alignment: .top) {
            Image(systemName: Constants.Icons.circle)
                .font(.system(size:14))
                .opacity(0.2)
            TextField("", text: $title)
        }
        
        Text("Notes")
            .opacity(0.2)
            .padding(.trailing, 30)
        
        HStack() {
            DueDateSelectionView(dueDate: $dueDate)
            
            if dueDate != nil {
                Button("Clear"){
                    dueDate = nil
                }
            }
            
            Button("Save"){
                if !title.isEmpty {
                    onSave(title, dueDate?.value)
                    title = ""
                    dueDate = nil 
                }
            }
        }.padding()
    }
}

#Preview {
    AddNewListItemView(onSave: {_, _ in})
}
