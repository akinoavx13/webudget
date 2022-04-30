//
//  File.swift
//  
//
//  Created by Maxime Maheo on 27/04/2022.
//

extension String {
    public func capitalizingFirstLetter() -> String { prefix(1).capitalized + dropFirst() }
}
