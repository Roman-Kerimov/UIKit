//
//  UIControl.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-11-30.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIControl: NSControl {
    
    public struct State: OptionSet {
        public var rawValue: RawValue
        
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
        
        public typealias RawValue = Int
        
        public static var normal: State {
            return .init(rawValue: 0)
        }
    }
    
    public struct Event: OptionSet {
        public var rawValue: RawValue
        
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
        
        public typealias RawValue = Int
        
        public static var touchUpInside: Event {
            return .init(rawValue: 1 <<  6)
        }
    }
    
    // MARK: - Accessing the Control’s Targets and Actions
    
    open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        self.target = target as AnyObject
        self.action = action
    }
}
