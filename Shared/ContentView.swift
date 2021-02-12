//
//  ContentView.swift
//  Shared
//
//  Created by Stefania Zinno on 12/02/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) private var dish: FetchedResults<Dish>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(dish) { dish in
                    Text(dish.name ?? "No Name").onTapGesture(perform: {
                        updateDish(dish)
                    })
                }.onDelete(perform: deleteDish)
            }.navigationTitle("Menu")
            .navigationBarItems(trailing: Button("Add Dish", action: {
                addDish()
            }))
        }
    }
    
    func saveContext(){
        do{
            try viewContext.save()
        } catch {
            fatalError("error")
        }
    }
    
    func addDish(){
        let newDish = Dish(context: viewContext)
        newDish.name = "Pizza"
        saveContext()
        }
    
    func deleteDish(offset: IndexSet){
        withAnimation {
            offset.map {dish[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    func updateDish(_ dish: FetchedResults<Dish>.Element){
        dish.name = "now changed"
      saveContext()
    }
    
}

   



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
