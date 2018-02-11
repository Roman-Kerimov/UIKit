//
//  UIResponder.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-11.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIResponder = NSResponder

public extension UIResponder {
    
    public var next: UIResponder? {
        return nextResponder
    }
}
