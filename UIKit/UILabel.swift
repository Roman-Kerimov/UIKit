//
//  UILabel.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UILabel: UITextField {
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        isBezeled = false
        drawsBackground = false
        isEditable = false
        isSelectable = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
