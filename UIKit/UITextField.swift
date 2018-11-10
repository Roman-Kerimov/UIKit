//
//  UITextField.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UITextField: NSTextField {
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var text: String? {
        get {
            return stringValue
        }
        
        set {
            stringValue = newValue ?? .init()
            adjustFontSize()
        }
    }
    
    open var textAlignment: NSTextAlignment {
        get {
            return alignment
        }
        
        set {
            alignment = newValue
        }
    }
    
    open override var font: UIFont? {
        get {
            return baseFont
        }
        
        set {
            baseFont = newValue
            adjustFontSize()
        }
    }
    
    open var adjustsFontSizeToFitWidth: Bool = false {
        didSet {
            adjustFontSize()
        }
    }
    
    private var baseFont: UIFont? = nil
    private func adjustFontSize() {
        
        guard adjustsFontSizeToFitWidth else {
            super.font = baseFont
            return
        }
        
        guard let text = text else {
            super.font = baseFont
            return
        }

        guard let baseFont = baseFont else {
            super.font = self.baseFont
            return
        }
        
        guard frame.width > 5 else {
            super.font = self.baseFont
            return
        }

        var font = baseFont
        while (text as NSString).size(withAttributes: [.font : font]).width > frame.width * 0.9 {
            font = font.withSize(font.pointSize * 0.9)
        }
        
        super.font = font
    }
}
