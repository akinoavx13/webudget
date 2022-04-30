//
//  File.swift
//  
//
//  Created by Maxime Maheo on 27/04/2022.
//

#if DEBUG
public func dd(_ parameters: Any...) {
    print("DD:", parameters.map { "\($0)" }.joined(separator: " • "))
}
#endif
