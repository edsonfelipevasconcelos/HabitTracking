//
//  ActivitiesListView.swift
//  HabitTracking
//
//  Created by EDSON FELIPE VASCONCELOS on 02/05/23.
//

import SwiftUI

struct ActivitiesListView: View {
    @ObservedObject var activities: Activities
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($activities.activities) { $activity in
                    NavigationLink(destination: ActivityDetailView(activity: $activity)) {
                        HStack {
                            Text(activity.name)
                            Spacer()
                            Text("\(activity.numberOfTimes)")
                        }
                    }
                }
                .onDelete(perform: removeItem)
            }
        }
        .toolbar {
            Button {
                showingAddActivity = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddActivity) {
            AddActivityView(activity: activities)
        }
    }
    
    func removeItem(at offset: IndexSet) {
        activities.activities.remove(atOffsets: offset)
    }
}

struct ActivitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesListView(activities: Activities.init())
    }
}
