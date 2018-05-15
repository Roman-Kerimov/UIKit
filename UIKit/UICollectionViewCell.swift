//
//  UICollectionViewCell.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UICollectionViewCell: UIView {
    
    public var backgroundColor: UIColor? {
        get {
            if let color = layer?.backgroundColor {
                return UIColor.init(cgColor: color)
            }
            else {
                return nil
            }
        }
        
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}
