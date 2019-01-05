//
//  UITextView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-08.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

@IBDesignable
open class UITextView: UIScrollView {
    
    private let textView: NSTextView = .init()
    
    public override convenience init(frame frameRect: NSRect) {
        self.init(frame: frameRect, textContainer: nil)
    }
    
    public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame)
        
        textView.frame = .init(origin: .zero, size: contentSize)
        textView.autoresizingMask = .width
        scrollView.documentView = textView
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open var text: String! {
        get {
            return textView.string
        }
        
        set {
            textView.string = newValue
        }
    }
    
    open var font: UIFont? {
        get {
            return textView.font
        }
        
        set {
            textView.font = newValue
        }
    }
    
    open var isEditable: Bool {
        get {
            return textView.isEditable
        }
        
        set {
            textView.isEditable = newValue
        }
    }
    
    open var isSelectable: Bool {
        get {
            return textView.isSelectable
        }
        
        set {
            textView.isSelectable = newValue
        }
    }
}
