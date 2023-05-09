//
//  ActivitiesItem.swift
//  HabitTracking
//
//  Created by EDSON FELIPE VASCONCELOS on 02/05/23.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    var numberOfTimes: Int = 0
}

class Activities: ObservableObject {
    @Published var activities: [Activity] {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: saveItems) {
                activities = decodedItems
                
                return
            }
        }
        
        activities = []
    }
}
