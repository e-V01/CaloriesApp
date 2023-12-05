//
//  RingView.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct RingView: View {
    @EnvironmentObject var viewModel: CDDataModel
    
    var percent: CGFloat = 50
    let width: CGFloat = 130
    let height: CGFloat = 130
    var body: some View {
        let ringValue = viewModel.saveValueEntity.first
        let multiplier = width / 44
        let progress = 1 - (ringValue?.ring ?? 0 / 1700)
        return HStack {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 4 * multiplier))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: CGFloat(Int(progress)), to: 1)
                    .stroke(LinearGradient(gradient:
                                            Gradient(colors: [Color("cards"), .blue]),
                                           startPoint: .top,
                                           endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 5 * multiplier,
                                               lineCap: .round,
                                               lineJoin: .round,
                                               miterLimit: .infinity,
                                               dash: [20, 0],
                                               dashPhase: 0))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(
                        Angle(degrees: 180),
                        axis: (x: 1.0, y: 0, z: 0)
                    )
                    .frame(width: width, height: height)
                Text("1790")
                    .bold()
                    .font(.title)
            }
            
            HStack(spacing: 30) {
                ForEach(viewModel.saveValueEntity) { item in
                    FoodElementValue(element: "cards", gram: String(format: "%.0f", item.cards), color: "cards", elementValue: CGFloat(item.cards))
                    FoodElementValue(element: "fat", gram: String(format: "%.0f", item.fat), color: "fat", elementValue: CGFloat(item.fat))
                    FoodElementValue(element: "protein", gram: String(format: "%.0f", item.protein), color: "protein", elementValue: CGFloat(item.protein))
                    
                }
            }
        }
        .frame(height: 180)
        .frame(width: UIScreen.main.bounds.width - 20)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(CustomShadow())
    }
}





#Preview {
    RingView()
        .environmentObject(CDDataModel())
}
