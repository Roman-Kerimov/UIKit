//
//  UIViewController.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-02-11.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UIViewController: NSViewController {
    
    open override func viewWillAppear() {
        super.viewWillAppear()
        
        viewWillAppear(true)
    }
    
    open func viewWillAppear(_ animated: Bool) {}
    
    open func didReceiveMemoryWarning() {}
}
