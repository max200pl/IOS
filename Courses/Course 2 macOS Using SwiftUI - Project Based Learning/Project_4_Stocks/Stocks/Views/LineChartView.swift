//
//  LineChartView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 09.06.2025.
//

import SwiftUI

struct LineChartView: View {
    
    let values: [Double]
    let labels: [String]
    let screenWidth: Double
    
    var path: Path {
        
        if values.isEmpty {
            return Path()
        }
        
        var offsetX: Double = (screenWidth/CGFloat(values.count))
        var path = Path()
        path.move(to: CGPoint(x: offsetX, y: values[0]/5))
        
        for value in values {
            offsetX += Double(screenWidth/Double(values.count))
            path.addLine(to: CGPoint(x: offsetX, y: value/5))
        }
        
        return path
        
    }
    
    var body: some View {
        VStack {
            
            path.stroke(Color.green, lineWidth: 2.0)
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            
            HStack {
                ForEach(labels, id: \.self) { label in
                    Text(label)
                        .frame(width: screenWidth/CGFloat(labels.count) - 10)
                }
            }
            
        }.frame(maxWidth: screenWidth)
    }
}

#Preview {
    LineChartView(values: Constants.getGraphValues(), labels: Constants.getYearlyLabels(), screenWidth: 800)
}
