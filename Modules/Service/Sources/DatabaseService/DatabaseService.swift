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
    func delete(transactions: [Transaction])
    
    func save(tag: Tag)
    func fetchTags() -> [Tag]
    func fetchTag(uuid: UUID) -> Tag?
    func updateTag(tag: Tag)
    func delete(tags: [Tag])
}

public final class DatabaseService: DatabaseServiceProtocol {
    
    // MARK: - Properties
    
    private var persistentContainer: NSPersistentContainer!
    private var context: NSManagedObjectContext!
    
    // MARK: - Lifecycle
    
    public init() {
        initDatabase()
    }
    
    public func save(transaction: Transaction) {
        let cdTransaction = CDTransaction(context: context)

        updateValues(of: cdTransaction,
                     with: transaction)
        
        saveIfNeeded()
    }
    
    public func fetchTransactions() -> [Transaction] {
        let fetchRequest: NSFetchRequest<CDTransaction> = NSFetchRequest(entityName: "\(CDTransaction.self)")
        
        do {
            let transactions = try context.fetch(fetchRequest)
            
            return transactions
                .compactMap { Transaction(transaction: $0) }
                .sorted(by: { $0.date > $1.date })
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func delete(transactions: [Transaction]) {
        let fetchRequest: NSFetchRequest<CDTransaction> = NSFetchRequest(entityName: "\(CDTransaction.self)")
        
        do {
            let allTransactions = try context.fetch(fetchRequest)
            allTransactions
                .filter { cdTransaction in
                    transactions.contains { cdTransaction.id == $0.id }
                }
                .forEach {
                    context.delete($0)
                }
            
            saveIfNeeded()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func save(tag: Tag) {
        let cdTag = CDTag(context: context)
        
        updateValues(of: cdTag,
                     with: tag)
        
        saveIfNeeded()
    }
    
    public func fetchTags() -> [Tag] {
        let fetchRequest: NSFetchRequest<CDTag> = NSFetchRequest(entityName: "\(CDTag.self)")
        
        do {
            let tags = try context.fetch(fetchRequest)
            
            return tags
                .compactMap { Tag(tag: $0) }
                .sorted(by: { $0.transactionsCount > $1.transactionsCount })
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func fetchTag(uuid: UUID) -> Tag? {
        let fetchRequest: NSFetchRequest<CDTag> = NSFetchRequest(entityName: "\(CDTag.self)")
        fetchRequest.predicate = NSPredicate(format: "id == %@", uuid.uuidString)

        do {
            let tags = try context.fetch(fetchRequest)
            
            return Tag(tag: tags.first)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func updateTag(tag: Tag) {
        let fetchRequest: NSFetchRequest<CDTag> = NSFetchRequest(entityName: "\(CDTag.self)")
        fetchRequest.predicate = NSPredicate(format: "id == %@", tag.id.uuidString)

        do {
            guard let cdTag = try context.fetch(fetchRequest).first else { return }
            
            updateValues(of: cdTag,
                         with: tag)
            
            saveIfNeeded()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func delete(tags: [Tag]) {
        let fetchRequest: NSFetchRequest<CDTag> = NSFetchRequest(entityName: "\(CDTag.self)")
        
        do {
            let allTags = try context.fetch(fetchRequest)
            allTags
                .filter { cdTag in
                    tags.contains { cdTag.id == $0.id }
                }
                .forEach {
                    context.delete($0)
                }
            
            saveIfNeeded()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // MARK: - Private methods
    
    private func initDatabase() {
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
    
    private func saveIfNeeded() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private func updateValues(of cdTag: CDTag,
                              with tag: Tag) {
        cdTag.id = tag.id
        cdTag.name = tag.name
    }
    
    private func updateValues(of cdTransaction: CDTransaction,
                              with transaction: Transaction) {
        cdTransaction.id = transaction.id
        cdTransaction.amount = Int64(transaction.amount)
        cdTransaction.date = transaction.date
        cdTransaction.isExpense = transaction.isExpense
        
        if let tag = transaction.tag {
            let fetchRequest: NSFetchRequest<CDTag> = NSFetchRequest(entityName: "\(CDTag.self)")
            fetchRequest.predicate = NSPredicate(format: "id == %@", tag.id.uuidString)
            
            let tag = try? context.fetch(fetchRequest).first
            
            cdTransaction.tag = tag
        }
    }
}
