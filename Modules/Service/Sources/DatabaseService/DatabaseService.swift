//
//  DatabaseService.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import CoreData
import Model

public protocol DatabaseServiceProtocol {
    func save(transaction: Transaction)
}

public final class DatabaseService: DatabaseServiceProtocol {
    
    // MARK: - Properties
    
    private var persistentContainer: NSPersistentContainer!
    private var context: NSManagedObjectContext!
    
    // MARK: - Lifecycle
    
    public init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        
        context = persistentContainer.newBackgroundContext()
    }
    
    public func save(transaction: Transaction) {
        let newTransaction = CDTransaction(context: context)
        newTransaction.value = Int64(transaction.value)
        newTransaction.date = transaction.date
        
        saveIfNeeded()
    }
    
    // MARK: - Private methods
    
    private func saveIfNeeded() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
