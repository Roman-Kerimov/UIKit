//
//  UIViewAutoresizing.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-12.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIViewAutoresizing = NSView.AutoresizingMask

public extension UIViewAutoresizing {
    
    public static var flexibleWidth: UIViewAutoresizing {
        return width
    }
    
    public static var flexibleHeight: UIViewAutoresizing {
        return height
    }
}
