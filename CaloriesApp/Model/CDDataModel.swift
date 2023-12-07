//
//  CDDataModel.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import Foundation
import CoreData

class CDDataModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var saveBreakfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity: [LunchEntity] = []
    @Published var saveValueEntity: [ValueEntity] = []

    init() {
        container = NSPersistentContainer(name: "CDfoodclass")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("DEBUG: Error loading data \(error.localizedDescription)")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let request1 = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let request2 = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let request3 = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            saveBreakfastEntity = try container.viewContext.fetch(request1)
            saveLunchEntity = try container.viewContext.fetch(request2)
            saveValueEntity = try container.viewContext.fetch(request3)

        } catch let error {
            print("DEBUG: request Number 1 error\(error.localizedDescription)")
        }
    }
    func addBreakfast(icon: String, name: String, ingridients: String, fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newMeal = BreakfastEntity(context: container.viewContext)
        newMeal.icon = icon
        newMeal.name = name
        newMeal.ingridients = ingridients
        newMeal.fat = Float(fat)
        newMeal.protein = Float(protein)
        newMeal.cards = Float(cards)
        saveData()
    }
    func addLunch(icon: String, name: String, ingridients: String, fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newMeal = BreakfastEntity(context: container.viewContext)
        newMeal.icon = icon
        newMeal.name = name
        newMeal.ingridients = ingridients
        newMeal.fat = Float(fat)
        newMeal.protein = Float(protein)
        newMeal.cards = Float(cards)
        saveData()
    }
    func addValue(fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        
        do {
            let results = try container.viewContext.fetch(newValue)
            if let entity = results.first {
                entity.fat += Float(fat)
                entity.protein = Float(protein)
                entity.cards = Float(cards)
            } else {
                let newValue = ValueEntity(context: container.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.cards = Float(cards)
            }
            saveData()
            fetchData()
        } catch {
            print("results \(error.localizedDescription)")
        }
        
    }
    func addCalories(calories: CGFloat) {
        let newCal = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        
        do {
            let results = try container.viewContext.fetch(newCal)
            if let entity  = results.first {
                entity.ring += Float(Int(calories))
            } else {
                let newEntity = ValueEntity(context: container.viewContext)
                newEntity.ring = 10
            }
        } catch {
            print("Calories error \(error.localizedDescription)")
        }
    }
    func addMealToggle(meal: BreakfastEntity) {
        meal.addperson.toggle()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch {
            print("save data error \(error.localizedDescription)")
        }
    }
}
