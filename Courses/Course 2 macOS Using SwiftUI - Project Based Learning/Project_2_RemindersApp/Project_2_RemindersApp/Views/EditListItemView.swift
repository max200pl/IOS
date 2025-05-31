//
//  EditListItemView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import SwiftUI

struct EditListItemView: View {
    var item: MyListItemViewModel
    @State private var selectedDate: Date = Date.today
    
    @ObservedObject var editListItemVM: EditListItemViewModel
    @State private var showCalendar: Bool = false
    var onUpdated: () -> Void
    
    init(item: MyListItemViewModel, onUpdated: @escaping () -> Void){
        self.item = item
        self.onUpdated = onUpdated
        editListItemVM = EditListItemViewModel(listItemVM: item)
    }
    
    var calendarButtonTitle: String {
        editListItemVM.selectedDate != nil ? editListItemVM.selectedDate!.formattedAdString : "Select Date"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(item.title, text: $editListItemVM.title)
            Divider()
            
            HStack {
                Text("Due Date")
                CalendarButtonView(title: calendarButtonTitle, showCalendar: $showCalendar) { selectedDate in
                    editListItemVM.selectedDate = selectedDate
                }
            }
            
            Spacer()
            
            HStack{
                Spacer()
                
                Button("Done"){
                    editListItemVM.save()
                    onUpdated()
                }.buttonStyle(.borderedProminent)
            }
        }.padding()
            .frame(minWidth: 200, minHeight: 200)
    }
}

#Preview {
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    EditListItemView(item: MyListItemViewModel(myListItem: MyListItem(context: viewContext)), onUpdated: { })
}
