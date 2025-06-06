//
//  BussinesNewsHeaderView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct BussinesNewsHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Business News")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("From Apple News")
                .font(.caption2)
                .opacity(0.4)
        }.padding()
            .frame(maxWidth:.infinity)
            .background(Color(red: 0.363, green: 0.354, blue: 0.383))
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    BussinesNewsHeaderView()
}
