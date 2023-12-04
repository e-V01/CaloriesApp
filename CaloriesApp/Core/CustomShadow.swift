//
//  CustomShadow.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct CustomShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)

    }
}

