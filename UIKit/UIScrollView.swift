//
//  UIScrollView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-08.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIScrollView: UIView {
    
    internal let scrollView: NSScrollView
    
    public override init(frame frameRect: NSRect) {
        scrollView = .init(frame: .init(origin: .zero, size: frameRect.size))
        super.init(frame: frameRect)
        
        addSubview(scrollView)
        
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
    }
    
    required public init?(coder: NSCoder) {
        scrollView = NSScrollView.init(coder: coder)!
        super.init(coder: coder)
    }
    
    open override func layout() {
        scrollView.frame.size = frame.size
    }
    
    open var alwaysBounceVertical: Bool {
        get {
            return scrollView.verticalScrollElasticity == .allowed
        }
        
        set {
            scrollView.verticalScrollElasticity = newValue ? .allowed : .none
        }
    }
    
    open var alwaysBounceHorizontal: Bool {
        get {
            return scrollView.horizontalScrollElasticity == .allowed
        }
        
        set {
            scrollView.horizontalScrollElasticity = newValue ? .allowed : .none
        }
    }
    
    open var showsHorizontalScrollIndicator: Bool {
        get {
            return scrollView.hasHorizontalScroller
        }
        
        set {
            scrollView.hasHorizontalScroller = newValue
            scrollView.scrollerInsets.bottom = newValue ? 0 : -100
        }
    }
    
    open var showsVerticalScrollIndicator: Bool {
        get {
            return scrollView.hasVerticalScroller
        }
        
        set {
            scrollView.hasVerticalScroller = newValue
            scrollView.scrollerInsets.right = newValue ? 0 : -100
        }
    }
    
    open func scrollRectToVisible(_ rect: CGRect, animated: Bool) {
        scrollView.contentView.scroll(to: rect.origin)
    }
}

extension UIScrollView: UIFocusItemScrollableContainer {
    
    @objc open var contentSize: NSSize {
        return scrollView.documentView?.frame.size ?? .zero
    }
    
    public var visibleSize: CGSize {
        return scrollView.documentVisibleRect.size
    }
}
