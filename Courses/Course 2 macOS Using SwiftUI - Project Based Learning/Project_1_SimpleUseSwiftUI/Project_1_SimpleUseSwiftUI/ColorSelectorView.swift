//
//  ColorSelectorView.swift
//  Project_1_SimpleUseSwiftUI
//
//  Created by Maksym Poskannyi on 27.05.2025.
//

import SwiftUI

struct ColorSelectorView: View {
    @Binding  var selectedColor: Color
    
    let colors: [Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(selectedColor == color ? Color.white : color)
                    .frame(width: 30, height: 30)
                    .padding()
                    .pointerStyle(.grabActive)
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}

#Preview {
    ColorSelectorView(selectedColor: .constant(.black))
}
