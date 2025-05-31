//
//  CalendarButtonView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import SwiftUI

struct CalendarButtonView: View {
    let title: String
    
    @Binding var showCalendar: Bool
    @State var selectedDate: Date = Date.today
    var onSelected: (Date) -> Void
    
    var body: some View {

        VStack {
            Button(title){
                showCalendar = true
            }.popover(isPresented: $showCalendar) {
                DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .onChange(of: selectedDate) {_, newValue in
                        onSelected(newValue)
                        showCalendar = false
                    }
            }
        }
    }
}

#Preview {
    CalendarButtonView(title: "Custom", showCalendar: .constant(true), onSelected: {_ in})
}
