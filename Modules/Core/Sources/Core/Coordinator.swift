//
//  Coordinator.swift
//  
//
//  Created by Maxime Maheo on 25/04/2022.
//

public protocol CoordinatorProtocol: AnyObject {
    
    // MARK: - Properties
    
    var parentCoordinator: CoordinatorProtocol? { get set }
    var children: [CoordinatorProtocol] { get set }
    
    // MARK: - Methods
    
    func start(params: Any...)
    func stop()
}

// MARK: - ChildDidStop -

extension CoordinatorProtocol {
    func childDidStop(_ child: CoordinatorProtocol?) {
        for (index, coordinator) in children.enumerated() where coordinator === child {
            children.remove(at: index)
        }
    }
}
