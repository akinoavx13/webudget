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
    func fetchTransactions() -> [Transaction]
}

public final class DatabaseService: DatabaseServiceProtocol {
    
    // MARK: - Properties
    
    private var persistentContainer: NSPersistentContainer!
    private var context: NSManagedObjectContext!
    
    // MARK: - Lifecycle
    
    public init() {
        guard let modelUrl = Bundle.module.url(forResource: "Model", withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelUrl)
        else { fatalError("Could not init DatabaseService") }
        
        persistentContainer = NSPersistentContainer(name: "Model", managedObjectModel: model)
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
    
    public func fetchTransactions() -> [Transaction] {
        let fetchRequest: NSFetchRequest<CDTransaction> = NSFetchRequest(entityName: "\(CDTransaction.self)")
        
        do {
            let transaction = try context.fetch(fetchRequest)
            
            return transaction.map { Transaction(transaction: $0) }
        } catch {
            fatalError(error.localizedDescription)
        }
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
