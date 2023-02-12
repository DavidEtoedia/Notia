//
//  Notia_ViewModel.swift
//  Notia
//
//  Created by Inyene Etoedia on 22/02/2023.
//

import Foundation
import CoreData


class CoreDataViewModel : ObservableObject {
    let container : NSPersistentContainer
    @Published var todo : [TodoEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "TodoModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("AN ERROR OCCURRED LOADING CORE DATA :\(error.localizedDescription)")
            } else{
                print("SUCCESSFUL")
               self.fetchData()
            }
        }
    }
    
    
    func fetchData(){
        let request = NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TodoEntity.created, ascending: false)]
        
        do{
          todo = try container.viewContext.fetch(request)
        } catch let error {
            print("AN ERROR OCCURRED : \(error.localizedDescription)")
            
        }
    }
    
    func createTodo(title: String, message: String){
        let saveData = TodoEntity(context: container.viewContext)
        saveData.title = title
        saveData.message = message
        saveData.created = Date.now
        self.saveData()
    }
    
    
    func deleteTodo(obj: TodoEntity){
        DispatchQueue.main.async {
            self.container.viewContext.delete(obj)
          }
        
        self.saveData()
    }

    
    func saveData(){
        do {
            try container.viewContext.save()
            self.fetchData()
        } catch let error {
            print("AN ERROR TRYING TO SAVE \(error.localizedDescription)")
        }
    }
    
    
}
