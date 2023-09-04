//
//  ContentView.swift
//  CoreDataProject
//
//  Created by David Ash on 02/09/2023.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Section("\(singer.wrappedFirstName) \(singer.wrappedLastName)") {
                    ForEach(singer.albumArray, id: \.self) { album in
                        Text(album.wrappedName)
                    }
                }
            }
            
            Button("Add Examples") {
                let plus = Album(context: moc)
                plus.name = "+"
                plus.singer = Singer(context: moc)
                plus.singer?.firstName = "Ed"
                plus.singer?.lastName = "Sheeran"
                plus.singer?.singerCode = "ES1"
                
                let multiply = Album(context: moc)
                multiply.name = "x"
                multiply.singer = Singer(context: moc)
                multiply.singer?.firstName = "Ed"
                multiply.singer?.lastName = "Sheeran"
                multiply.singer?.singerCode = "ES1"
                
                let lover = Album(context: moc)
                lover.name = "Lover"
                lover.singer = Singer(context: moc)
                lover.singer?.firstName = "Taylor"
                lover.singer?.lastName = "Swift"
                lover.singer?.singerCode = "TS1"
                
                let nineteen = Album(context: moc)
                nineteen.name = "19"
                nineteen.singer = Singer(context: moc)
                nineteen.singer?.firstName = "Adele"
                nineteen.singer?.lastName = "Adkins"
                nineteen.singer?.singerCode = "AD1"
                
                let thirty = Album(context: moc)
                thirty.name = "30"
                thirty.singer = Singer(context: moc)
                thirty.singer?.firstName = "Adele"
                thirty.singer?.lastName = "Adkins"
                thirty.singer?.singerCode = "AD1"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
