//
//  PlayView.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/14/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

class PlayView: UIViewController  {
    
    var levelNumbers = [1,2,3,4,5,6,7,8,9,10,11,12]
    let cellID = "cellID"
    
    var levelSelect: Int = 0
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        view.backgroundColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(LevelCell.self, forCellWithReuseIdentifier: cellID)
        
        backButton.addTarget(self, action: #selector(backButtonPress(sender:)), for: .touchUpInside)
        
        levelNumber.addTarget(self, action: #selector(levelSelected(sender:)), for: .touchUpInside)
        
        levelNumber.isEnabled = false
        
    }
    
    @objc func levelSelected(sender:UIButton!) {
        
        let CounterTest: GameScreen = GameScreen()
        CounterTest.levelSelected = levelSelect
        print(CounterTest.levelSelected)
        
        self.present(CounterTest, animated: true, completion: nil)
    }
    
    @objc func backButtonPress(sender:UIButton!) {
        
        let viewController = ViewController()
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    //MARK: - View Objects
    
    let backButton: UIButton = {
        let button = UIButton()
            button.setTitle("Back", for: .normal)
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
            button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let level: UILabel = {
        let label = UILabel()
            label.text = "Level Select"
            label.textColor = UIColor.red
            label.font = UIFont(name: "AvenirNext-Bold", size: 60)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    let levelNumber: UIButton = {
        let button = UIButton()
            button.setTitle("Select Level", for: .normal)
            button.setTitleColor(UIColor.black, for: UIControlState(rawValue: 0))
            button.titleLabel?.font = UIFont (name: "AvenirNext-Bold", size: 70)
            button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
     }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            cView.backgroundColor = UIColor.clear
            cView.translatesAutoresizingMaskIntoConstraints = false
        
        return cView
    }()
    
    //MARK: - Set Up Views
    func setUpViews() {
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
        view.addSubview(level)
        level.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        level.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        level.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        level.heightAnchor.constraint(equalToConstant: 150)
        
        view.addSubview(levelNumber)
        levelNumber.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 20).isActive = true
        levelNumber.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        levelNumber.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        levelNumber.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -20).isActive = true
        
        view.addSubview(backButton)
        backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    }
    
}
