//
//  FoodCart.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct FoodCart: View {
    var body: some View {
        VStack {
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
    }
}

#Preview {
    FoodCart()
}
