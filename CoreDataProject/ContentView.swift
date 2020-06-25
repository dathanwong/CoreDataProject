//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Dathan Wong on 6/22/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    @Environment(\.managedObjectContext) var moc
    @State private var filter = "K"
    
    var body: some View {
        VStack{
            TextField("Filter", text: $filter)
            FilteredList(filter: filter, sortDescriptions: [])
            Button("Add"){
                let uk = Country(context: self.moc)
                uk.shortName = "UK"
                uk.fullName = "United Kingdom"
                
                let candy1 = Candy(context: self.moc)
                candy1.name = "Mars"
                candy1.origin = uk
                
                let candy2 = Candy(context: self.moc)
                candy2.name = "KitKat"
                candy2.origin = uk
                
                try? self.moc.save()
            }
        }
    }
}

struct FilteredList: View{
    var fetchRequest: FetchRequest<Candy>
    
    init(filter: String, sortDescriptions: [NSSortDescriptor]){
        fetchRequest = FetchRequest<Candy>(entity: Candy.entity(), sortDescriptors: sortDescriptions, predicate: NSPredicate(format: "name BEGINSWITH %@", filter))
    }
    
    var body: some View{
        List(fetchRequest.wrappedValue, id: \.self){ candy in
            Text("\(candy.wrappedName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
