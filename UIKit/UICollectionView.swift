//
//  UICollectionView.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

open class UICollectionView: UIScrollView, NSCollectionViewDataSource, NSCollectionViewDelegate {
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource!.collectionView(self, numberOfItemsInSection: section)
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        _ = dataSource!.collectionView(self, cellForItemAt: indexPath)
        return item!
    }
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        delegate?.collectionView!(self, didSelectItemAt: indexPaths.first!)
    }
    
    private let collectionView: NSCollectionView = .init()
    
    public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = layout
        collectionView.frame = .init(origin: .zero, size: contentSize)
        collectionView.isSelectable = true
        
        documentView = collectionView
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open weak var dataSource: UICollectionViewDataSource?
    open weak var delegate: UICollectionViewDelegate?
    
    private var reuseIdentifierDictionary: [String: UICollectionViewCell.Type] = .init()
    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        reuseIdentifierDictionary[identifier] = cellClass as? UICollectionViewCell.Type
    }
    
    private var item: CollectionViewItem? = nil
    open func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reuseIdentifierDictionary[identifier]!.init()
        cell.frame.size = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize ?? .zero
        item = CollectionViewItem.init(view: cell)
        return cell
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
    
    open func numberOfItems(inSection section: Int) -> Int {
        return collectionView.numberOfItems(inSection: section)
    }
    
    open var visibleCells: [UICollectionViewCell] {
        return collectionView.visibleItems().map {$0.view} as! [UICollectionViewCell]
    }
    
    open func deselectItem(at indexPath: IndexPath, animated: Bool) {
        collectionView.deselectItems(at: [indexPath])
    }
    
    open func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionViewScrollPosition, animated: Bool) {
        collectionView.scrollToItems(at: [indexPath], scrollPosition: scrollPosition)
    }
    
    open func reloadData() {
        collectionView.reloadData()
    }
}
