//
//  UICollectionView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UICollectionView: UIScrollView {
    
    private class DelegateView: UIView, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
        var uiCollectionView: UICollectionView {
            return superview as! UICollectionView
        }
        
        public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
            return uiCollectionView.dataSource!.collectionView(uiCollectionView, numberOfItemsInSection: section)
        }
        
        public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
            _ = uiCollectionView.dataSource!.collectionView(uiCollectionView, cellForItemAt: indexPath)
            return uiCollectionView.item!
        }
        
        public func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
            return uiCollectionView.dataSource!.collectionView!(uiCollectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        }
        
        
        // MARK: - NSCollectionViewDelegate
        
        public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
            uiCollectionView.delegate?.collectionView!(uiCollectionView, didSelectItemAt: indexPaths.first!)
        }
        
        
        // MARK: - NSCollectionViewDelegateFlowLayout
        
        private var delegateFlowLayout: UICollectionViewDelegateFlowLayout? {
            return uiCollectionView.delegate as? UICollectionViewDelegateFlowLayout
        }
        
        private var collectionViewFlowLayout: UICollectionViewFlowLayout {
            return uiCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        }
        
        public func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
            return delegateFlowLayout?.collectionView?(uiCollectionView, layout: collectionViewLayout, sizeForItemAt: indexPath) ?? collectionViewFlowLayout.itemSize
        }
        
        public func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return delegateFlowLayout?.collectionView?(uiCollectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section) ?? collectionViewFlowLayout.minimumLineSpacing
        }
        
        public func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return delegateFlowLayout?.collectionView?(uiCollectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section) ?? collectionViewFlowLayout.minimumInteritemSpacing
        }
        
        public func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
            return delegateFlowLayout?.collectionView?(uiCollectionView, layout: collectionViewLayout, referenceSizeForFooterInSection: section) ?? collectionViewFlowLayout.footerReferenceSize
        }
    }
    
    private let delegateView: DelegateView = .init()
    
    private let collectionView: NSCollectionView = .init()
    
    public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame)
        
        addSubview(delegateView)
        
        collectionView.dataSource = delegateView
        collectionView.delegate = delegateView
        
        collectionView.collectionViewLayout = layout
        collectionView.frame = .init(origin: .zero, size: scrollView.contentSize)
        collectionView.isSelectable = true
        
        scrollView.documentView = collectionView
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open weak var dataSource: UICollectionViewDataSource?
    open weak var delegate: UICollectionViewDelegate?
    
    open var backgroundView: UIView? {
        get {
            return collectionView.backgroundView as? UIView
        }
        
        set {
            collectionView.backgroundView = newValue
        }
    }
    
    open override var contentSize: NSSize {
        return collectionViewLayout.collectionViewContentSize
    }
    
    private var reuseIdentifierDictionary: [String: UICollectionViewCell.Type] = .init()
    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        reuseIdentifierDictionary[identifier] = cellClass as? UICollectionViewCell.Type
    }
    
    open func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) {
        collectionView.register(viewClass, forSupplementaryViewOfKind: elementKind, withIdentifier: .init(rawValue: identifier))
    }
    
    private var item: CollectionViewItem? = nil
    open func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reuseIdentifierDictionary[identifier]!.init()
        cell.frame.size = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize ?? .zero
        item = CollectionViewItem.init(view: cell)
        return cell
    }
    
    open func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView {
        
        return collectionView.makeSupplementaryView(ofKind: elementKind, withIdentifier: .init(rawValue: identifier), for: indexPath) as! UICollectionReusableView
    }
    
    private class CollectionViewItem: NSCollectionViewItem {
        
        let cell: UICollectionViewCell
        
        init(view: UICollectionViewCell) {
            cell = view
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func loadView() {
            view = cell
        }
    }
    
    
    // MARK: - Changing the Layout
    open var collectionViewLayout: UICollectionViewLayout {
        get {
            
            if collectionView.collectionViewLayout == nil {
                collectionView.collectionViewLayout = .init()
            }
            
            return collectionView.collectionViewLayout!
        }
        
        set {
            collectionView.collectionViewLayout = newValue
        }
    }
    
    
    // MARK: - Getting the State of the Collection View
    
    open func numberOfItems(inSection section: Int) -> Int {
        return collectionView.numberOfItems(inSection: section)
    }
    
    open var visibleCells: [UICollectionViewCell] {
        return collectionView.visibleItems().map {$0.view} as! [UICollectionViewCell]
    }
    
    
    // MARK: - Inserting, Moving, and Deleting Items
    
    open func insertItems(at indexPaths: [IndexPath]) {
        collectionView.insertItems(at: .init(indexPaths))
    }
    
    open func moveItem(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        collectionView.moveItem(at: indexPath, to: newIndexPath)
    }
    
    open func deleteItems(at indexPaths: [IndexPath]) {
        collectionView.deleteItems(at: .init(indexPaths))
    }
    
    
    // MARK: - Reordering Items Interactively
    
    @discardableResult open func beginInteractiveMovementForItem(at indexPath: IndexPath) -> Bool {
        return false
    }
    
    open func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint) {
        
    }
    
    open func endInteractiveMovement() {
        
    }
    
    open func cancelInteractiveMovement() {
        
    }
    
    
    // MARK: - Managing the Selection
    
    open func deselectItem(at indexPath: IndexPath, animated: Bool) {
        collectionView.deselectItems(at: [indexPath])
    }
    
    
    // MARK: - Locating Items and Views in the Collection View
    
    open func indexPathForItem(at point: CGPoint) -> IndexPath? {
        return collectionView.indexPathForItem(at: point)
    }
    
    open var indexPathsForVisibleItems: [IndexPath] {
        return collectionView.indexPathsForVisibleItems().sorted()
    }
    
    open func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        return collectionView.item(at: indexPath)?.view as? UICollectionViewCell
    }
    
    
    // MARK: - Scrolling an Item Into View
    
    open func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionViewScrollPosition, animated: Bool) {
        collectionView.scrollToItems(at: [indexPath], scrollPosition: scrollPosition)
    }
    
    
    // MARK: - Animating Multiple Changes to the Collection View
    
    open func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        collectionView.performBatchUpdates(updates, completionHandler: completion)
    }
    
   
    // MARK: - Reloading Content
    
    open func reloadData() {
        collectionView.reloadData()
    }
    
    open func reloadItems(at indexPaths: [IndexPath]) {
        collectionView.reloadItems(at: .init(indexPaths))
    }
    
    
    // MARK: - Type Properties
   
    public static let elementKindSectionFooter: String = NSCollectionView.elementKindSectionFooter
}
