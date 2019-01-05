//
//  UIProgressView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-23.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIProgressView: UIView {
    
    let progressIndicator: NSProgressIndicator
    
    public override init(frame frameRect: NSRect) {
        progressIndicator = .init(frame: .init(origin: .zero, size: frameRect.size))
        super.init(frame: frameRect)
        
        progressIndicator.style = .bar
        
        progressIndicator.isIndeterminate = false
        progressIndicator.isDisplayedWhenStopped = true
        
        progressIndicator.minValue = 0
        progressIndicator.maxValue = 1
    }
    
    required public init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layout() {
        progressIndicator.frame.size = frame.size
    }
    
    open func setProgress(_ progress: Float, animated: Bool) {
        progressIndicator.doubleValue = .init(progress)
    }
}
