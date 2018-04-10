//
//  PlayViewExtention.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/14/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

extension PlayView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelNumbers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? LevelCell else {
            fatalError("Unexpected index path")
        }
        cell.label.text = "\(levelNumbers[indexPath.row])"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/3.5, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) is LevelCell else {
            fatalError("Unexpected index path")
        }
        
        levelNumber.isEnabled = true
        levelNumber.setTitle("\(levelNumbers[indexPath.row])", for: .normal)
        levelSelect = levelNumbers[indexPath.row]
        UserDefaults().set(levelSelect, forKey: "pLevel")
        
        
    }
}

