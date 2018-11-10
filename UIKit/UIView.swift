//
//  UIView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-11.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIView = NSView

public extension UIView {
    
    public var clipsToBounds: Bool {
        get {
            return true
        }
        
        set {
            
        }
    }
    
    
    // MARK: - Configuring the Bounds and Frame Rectangles
    
    public var center: CGPoint {
        get {
            return .init(x: frame.midX, y: frame.midY)
        }
        
        set {
            frame.origin = .init(x: newValue.x - frame.width/2, y: newValue.y - frame.height/2)
        }
    }

    
    // MARK: - Animating Views
    
    class func setAnimationsEnabled(_ enabled: Bool) {
        
    }
}
