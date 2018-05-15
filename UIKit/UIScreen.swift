//
//  UIScreen.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIScreen: NSObject {
    
    open static let main: UIScreen = .init()
    
    open var bounds: CGRect {
        return NSScreen.main?.frame ?? .zero
    }
}
