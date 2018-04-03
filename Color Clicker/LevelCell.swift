//
//  LevelCell.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/14/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

class LevelCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60)
        return label
    }()
    func setupViews(){
        backgroundColor = UIColor.orange
        
        addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
    }
}
