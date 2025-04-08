//
//  ContentView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            VStack{
                Text("Text")
            }
        }
    }

  
  
}



#Preview {
    ContentView()
}
