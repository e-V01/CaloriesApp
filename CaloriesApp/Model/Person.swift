//
//  Person.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var image: String
}

var icons: [Person] = [
    Person(image: "pizza"),
    Person(image: "donut"),
    Person(image: "rice"),
    Person(image: "burger"),
    Person(image: "steak"),
    Person(image: "hotdog"),
    Person(image: "ramen"),
    Person(image: "turkey")
                       
]
