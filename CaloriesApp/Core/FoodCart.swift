//
//  FoodCart.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct FoodCart: View {
    var width: CGFloat = 200
    @State private var cards: CGFloat = 20
    @State private var protein: CGFloat = 100
    @State private var fat: CGFloat = 70
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var icon: String = ""

    
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
                Elements(name: "Cards", foodElement: cards, mulitplier: multiplier, color: "cards")
                Elements(name: "Fat", foodElement: fat, mulitplier: multiplier, color: "fat")
                Elements(name: "Protein", foodElement: protein, mulitplier: multiplier, color: "protein")
            }
        }
    }
}

struct Elements: View {
    var name = "name"
    var foodElement: CGFloat = 100
    var mulitplier: CGFloat = 0
    var color = ""
    var body: some View {
        let width: CGFloat = 130
        var mulitplier = width / 200
        return VStack {
            Text(name)
                .font(.system(size: 12))
            Rectangle()
                .frame(width: foodElement * mulitplier, height: 5)
                .cornerRadius(5)
                .foregroundStyle(Color(color))
        }
        .padding(.bottom, 5)
        .frame(width: 90)
    }
}

#Preview {
    FoodCart()
}