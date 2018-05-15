//
//  UIScrollView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-08.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIScrollView: NSScrollView {
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        hasVerticalScroller = true
        hasHorizontalScroller = true
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open var alwaysBounceVertical: Bool {
        get {
            return verticalScrollElasticity == .allowed
        }
        
        set {
            verticalScrollElasticity = newValue ? .allowed : .none
        }
    }
    
    open var alwaysBounceHorizontal: Bool {
        get {
            return horizontalScrollElasticity == .allowed
        }
        
        set {
            horizontalScrollElasticity = newValue ? .allowed : .none
        }
    }
    
    open var showsHorizontalScrollIndicator: Bool {
        get {
            return hasHorizontalScroller
        }
        
        set {
            hasHorizontalScroller = newValue
            horizontalScroller?.alphaValue = newValue ? 1 : 0
        }
    }
    
    open var showsVerticalScrollIndicator: Bool {
        get {
            return hasVerticalScroller
        }
        
        set {
            hasVerticalScroller = newValue
            verticalScroller?.alphaValue = newValue ? 1 : 0
        }
    }
}
