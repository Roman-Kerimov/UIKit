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
    
    open override var contentSize: NSSize {
        return documentView?.frame.size ?? .zero
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
            scrollerInsets.bottom = newValue ? 0 : -100
        }
    }
    
    open var showsVerticalScrollIndicator: Bool {
        get {
            return hasVerticalScroller
        }
        
        set {
            hasVerticalScroller = newValue
            scrollerInsets.right = newValue ? 0 : -100
        }
    }
}
