//
//  FoodCart.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct FoodCart: View {
    var width: CGFloat = 200
    @State var cards: CGFloat = 20
    @State var protein: CGFloat = 100
    @State var fat: CGFloat = 70
    @State var name: String = ""
    @State var title: String = ""
    @State var icon: String = ""

    
    var body: some View {
        let multiplier = width / 40
        return VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text("Name")
                    .font(.title2)
                    .frame(width: 160)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            .bold()
            
            HStack {
                Text("Titles")
                Spacer()
            }
            .frame(width: 200, height: 30)
            .minimumScaleFactor(0.6)
        }
        .offset(x: 20, y: -20)
        .frame(width: 270, height: 110)
        .background(.white)
        .cornerRadius(10)
        .modifier(CustomShadow())
        .overlay(alignment: .topLeading) {
            Image("burger")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .offset(x: -12, y: -16)
            
        }
        .overlay(alignment: .bottom) {
            HStack {
                Elements(name: "cards", foodElement: cards, mulitplier: multiplier, color: "cards")
                Elements(name: "fat", foodElement: fat, mulitplier: multiplier, color: "fat")
                Elements(name: "protein", foodElement: protein, mulitplier: multiplier, color: "protein")
            }
        }
    }
}



#Preview {
    FoodCart()
}
