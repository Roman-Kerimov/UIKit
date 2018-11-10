//
//  UICollectionViewDelegateFlowLayout.swift
//  UIKit
//
//  Created by Roman Kerimov on 2018-05-04.
//  Copyright © 2018 Roman Kerimov. All rights reserved.
//

@objc public protocol UICollectionViewDelegateFlowLayout: UICollectionViewDelegate {
    
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
}
