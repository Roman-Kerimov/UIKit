//
//  UIView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-11.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIView: NSView {
    
    open var backgroundColor: UIColor? {
        get {
            if let color = layer?.backgroundColor {
                return UIColor.init(cgColor: color)
            }
            else {
                return nil
            }
        }
        
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
    
    open var tintColor: UIColor! {
        get {
            return UIColor.controlAccentColor
        }
        
        set {
            
        }
    }

    
    open var clipsToBounds: Bool {
        get {
            return true
        }
        
        set {
            
        }
    }
    
    
    // MARK: - Configuring the Bounds and Frame Rectangles
    
    open var center: CGPoint {
        get {
            return .init(x: frame.midX, y: frame.midY)
        }
        
        set {
            frame.origin = .init(x: newValue.x - frame.width/2, y: newValue.y - frame.height/2)
        }
    }

    
    // MARK: - Animating Views
    
    open class func setAnimationsEnabled(_ enabled: Bool) {
        
    }
}
