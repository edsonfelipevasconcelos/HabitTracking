//
//  AddActivityView.swift
//  HabitTracking
//
//  Created by EDSON FELIPE VASCONCELOS on 02/05/23.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var activity: Activities
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var numberOfTimes: Int = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Name") {
                        TextField("", text: $name)
                    }
                    
                    Section("Description") {
                        TextEditor(text: $description)
                    }
                }
                .navigationBarTitle("Add activity")
                .navigationBarItems(
                    leading: Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel")
                    },
                    trailing: Button(action: {
                        let item = Activity(name: name, description: description)
                        activity.activities.append(item)
                        dismiss()
                    }) {
                        Text("Save")
                    })
            }
            .padding()
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activity: Activities())
    }
}
