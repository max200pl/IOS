//
//  DueDateSelectionView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import SwiftUI

struct DueDateSelectionView: View {
    @Binding var dueDate: DueDate?
    
    @State private var selectedDate: Date = Date.today
    @State private var showCalendar: Bool = false
    
    var body: some View {
        Menu {
            Button {
                dueDate = .today
            } label: {
                VStack {
                    Text("Today \n \(Date.today.formattedAdString)")
                }
            }
            
            Button {
                dueDate = .tomorrow
            } label: {
                VStack {
                    Text("Tommorow \n \(Date.tomorrow.formattedAdString)")
                }
            }
            
            Button {
                showCalendar = true
            } label: {
                Text("Custom")
            }
        } label: {
            Label(dueDate == nil ? "Add Data:" : dueDate!.title, systemImage: "calendar")
        }.menuStyle(.borderedButton)
            .fixedSize()
            .popover(isPresented: $showCalendar) {
                DatePicker(
                    "Custom",
                    selection: $selectedDate,
                    displayedComponents:.date)
                .labelsHidden()
                .datePickerStyle(.graphical)
                .onChange(of: selectedDate) {_, newValue in
                    dueDate = .custom(newValue)
                    showCalendar = false
                }
            }
    }
}

#Preview {
    DueDateSelectionView(dueDate: .constant(nil))
}
