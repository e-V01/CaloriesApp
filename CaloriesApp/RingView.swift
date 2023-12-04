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
        let progress = 1 - (ringValue?.ring ?? 0 / 1000)
        return HStack {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: CGFloat(progress), to: 1)
                    .stroke(LinearGradient(gradient:
                                            Gradient(colors: [Color("cards"), .blue]),
                                           startPoint: .top,
                                           endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 5,
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
            FoodElementValue()
        }
        .frame(height: 180)
        .frame(width: UIScreen.main.bounds.width - 20)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(customShadow())
    }
}

struct customShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)

    }
}



#Preview {
    RingView()
        .environmentObject(CDDataModel())
}
