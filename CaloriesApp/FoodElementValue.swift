//
//  FoodElementValue.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct FoodElementValue: View {
    var element = " "
    var gram = " "
    var color = " "
    var elementValue:  CGFloat = 0
    
    var body: some View {
        let height: CGFloat = 130
        let multiplier = height / 2000
       return VStack {
            ZStack {
                Rectangle()
                    .frame(width: 8, height: 110)
                    .foregroundStyle(.gray.opacity(0.5))
                if elementValue != 0 {
                    Rectangle()
                    .frame(width: 8, height: 110)
                    .foregroundStyle(.gray.opacity(0.5))
                }
            }
        }
    }
}

#Preview {
    FoodElementValue()
}
