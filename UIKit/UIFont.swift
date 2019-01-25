//
//  UIFont.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-08.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

public typealias UIFont = NSFont

public extension UIFont {
    func withSize(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: fontName, size: fontSize)!
    }
}
