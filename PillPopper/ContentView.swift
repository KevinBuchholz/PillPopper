//
//  ContentView.swift
//  PillPopper
//
//  Created by Kevin Buchholz on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
        VStack {
            Image(systemName: "pill.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()
            Text("Hello, Kevin.")
            Text("Let's make sure you take your medicine.")
            NavigationLink("New schedule", destination: NewScheduleView())
        }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
