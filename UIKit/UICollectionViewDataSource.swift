//
//  UICollectionViewDataSource.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

@objc public protocol UICollectionViewDataSource: NSObjectProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    @objc optional func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}
