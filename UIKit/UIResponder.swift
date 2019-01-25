//
//  UIResponder.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-11.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIResponder = NSResponder

public extension UIResponder {
    
    var next: UIResponder? {
        return nextResponder
    }
}
