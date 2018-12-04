//
//  UIGestureRecognizer.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-11-30.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIGestureRecognizer = NSGestureRecognizer

public extension UIGestureRecognizer {
    var cancelsTouchesInView: Bool {
        get {
            return false
        }
        
        set {
            
        }
    }
}
