//
//  ContentView.swift
//  SwiftUIAndCoreData
//
//  Created by Raphael Berendes (extern) on 24.10.19.
//  Copyright © 2019 Raphael Berendes (extern). All rights reserved.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    @FetchRequest(fetchRequest: Things.allThingsFetchRequest()) var things: FetchedResults<Things>
    
    var body: some View {
        
        VStack {
            List(things) { thing in
                ThingCell(with: thing.name)
            }
            
            Button(action: {
                Things.saveRandomThing()
            }) {
                Text("Save thing")
            }
            Spacer()
            Button(action: {
                Things.deleteAll()
            }) {
                Text("Delete all things")
                    .foregroundColor(Color.red)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
