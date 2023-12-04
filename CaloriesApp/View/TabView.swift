//
//  TabView.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI



struct TabView: View {
    @Binding var itemSelected: Tab
    var body: some View {
        HStack(spacing: 30) {
            ForEach(selectedTab) { item in
                Button(action: {
                    withAnimation {
                        itemSelected = item.tab

                    }
                }, label: {
                    Text(item.food)
                        .foregroundStyle(itemSelected == item.tab ? .white : . black)
                        .padding(8)
                        .background(itemSelected == item.tab ? .black : Color(""))
                        .cornerRadius(10)
                })
            }
        }
    }
}

struct foodSelected: Identifiable {
    var id = UUID()
    var food: String
    var tab: Tab
}

var selectedTab: [foodSelected] = [
    foodSelected(food: "Breakfast", tab: .Breakfast),
    foodSelected(food: "Lunch", tab: .Lunch),
    foodSelected(food: "Dinner", tab: .Dinner),
    foodSelected(food: "Snacks", tab: .Snacks)

]

enum Tab: String {
    case Breakfast
    case Lunch
    case Dinner
    case Snacks
}

#Preview {
    TabView(itemSelected: .constant(.Breakfast))
}
