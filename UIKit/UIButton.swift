//
//  UIButton.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-11-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIButton: UIControl {
    
    private let button: NSButton = .init()
    
    public init() {
        super.init(frame: .zero)
        
        addSubview(button)
        
        button.bezelStyle = .texturedRounded
        button.isBordered = false
        button.title = .init()
        
        button.addSubview(titleLabel!)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layout() {
        button.frame.size = frame.size
        titleLabel?.frame.size = frame.size
    }
    
    open var titleLabel: UILabel? = .init()
    
    open func title(for state: UIControl.State) -> String? {
        return titleLabel?.text
    }
    
    open func setTitle(_ title: String?, for state: UIControl.State) {
        titleLabel?.text = title
    }
    
    open func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        titleLabel?.textColor = color
    }
}
