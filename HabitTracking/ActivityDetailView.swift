//
//  ActivityDetailView.swift
//  HabitTracking
//
//  Created by EDSON FELIPE VASCONCELOS on 02/05/23.
//

import SwiftUI

struct ActivityDetailView: View {
    @Binding var activity: Activity
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(activity.description)
                        .font(.callout)
                    Spacer()
                    Text("\(activity.numberOfTimes)")
                        .font(.subheadline)
                    Button("Increment") {
                        activity.numberOfTimes += 1
                    }
                }
                .padding()
            }
            .navigationBarTitle(activity.name, displayMode: .inline)
            
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var activities = Activity(name: "Run", description: "Good", numberOfTimes: 0)
    static var previews: some View {
        ActivityDetailView(activity: .constant(activities))
    }
}
