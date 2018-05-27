//
//  UIProgressView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-23.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIProgressView: NSProgressIndicator {
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        style = .bar
        
        isIndeterminate = false
        isDisplayedWhenStopped = true
        
        minValue = 0
        maxValue = 1
    }
    
    required public init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setProgress(_ progress: Float, animated: Bool) {
        doubleValue = .init(progress)
    }
}
