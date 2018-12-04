//
//  UILabel.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UILabel: UIView {
    
    let textField: UITextField = .init()
    
    private lazy var sizeConstraints = [
        textField.widthAnchor.constraint(equalTo: widthAnchor),
        textField.heightAnchor.constraint(equalTo: heightAnchor),
    ]
    
    open override var translatesAutoresizingMaskIntoConstraints: Bool {
        get {
            return super.translatesAutoresizingMaskIntoConstraints
        }
        
        set {
            super.translatesAutoresizingMaskIntoConstraints = newValue
            
            if newValue {
                NSLayoutConstraint.deactivate(sizeConstraints)
            }
            else {
                NSLayoutConstraint.activate(sizeConstraints)
            }
        }
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        textField.isBezeled = false
        textField.drawsBackground = false
        textField.isEditable = false
        textField.isSelectable = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var text: String? {
        get {
            return textField.text
        }
        
        set {
            textField.text = newValue
        }
    }
    
    open var font: UIFont! {
        get {
            return textField.font
        }
        
        set {
            textField.font = newValue
        }
    }
    
    open var textColor: UIColor! {
        get {
            return textField.textColor
        }
        
        set {
            textField.textColor = newValue
        }
    }
    
    open var textAlignment: NSTextAlignment {
        get {
            return textField.textAlignment
        }
        
        set {
            textField.textAlignment = newValue
        }
    }
    
    open var adjustsFontSizeToFitWidth: Bool {
        get {
            return textField.adjustsFontSizeToFitWidth
        }
        
        set {
            textField.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        }
    }
}
