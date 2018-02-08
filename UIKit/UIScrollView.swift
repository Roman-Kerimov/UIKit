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
}
