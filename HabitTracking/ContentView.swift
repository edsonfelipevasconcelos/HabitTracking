//
//  ContentView.swift
//  HabitTracking
//
//  Created by EDSON FELIPE VASCONCELOS on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    
    var body: some View {
        NavigationStack {
            VStack {
                ActivitiesListView(activities: activities)
            }
            .navigationTitle("Habit Tracking")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
