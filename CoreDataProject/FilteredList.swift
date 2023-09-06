//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by David Ash on 04/09/2023.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    enum predicate: String {
        case beginsWith = "BEGINSWITH"
        case containsCaseInsensitive = "CONTAINS[c]"
    }
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(predicate: FilteredList.predicate,
         filterKey: String,
         filterValue: String,
         sortDescriptors: [SortDescriptor<T>] = [],
         @ViewBuilder content: @escaping (T) -> Content)
    {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: sortDescriptors,
            predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
