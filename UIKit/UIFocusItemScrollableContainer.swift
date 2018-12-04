//
//  UIFocusItemScrollableContainer.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-11-30.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public protocol UIFocusItemScrollableContainer: UIFocusItemContainer {
    var contentSize: CGSize { get }
    var visibleSize: CGSize { get }
}
