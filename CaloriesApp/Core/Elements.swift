//
//  Elements.swift
//  CaloriesApp
//
//  Created by Y K on 05.12.2023.
//

import SwiftUI

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
