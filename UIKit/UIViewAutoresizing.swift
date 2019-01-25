//
//  UIViewAutoresizing.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-12.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIViewAutoresizing = NSView.AutoresizingMask

public extension UIViewAutoresizing {
    
    static var flexibleWidth: UIViewAutoresizing {
        return width
    }
    
    static var flexibleHeight: UIViewAutoresizing {
        return height
    }
}
