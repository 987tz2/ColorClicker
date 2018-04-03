//
//  ViewControllerLevelView.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/23/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

class ViewControllerLevelView: UIViewController {

    //Mark: - Variables
    
    var seconds = 15
    var timer = Timer()
    var isTimerRunning = false
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        backButton.addTarget(self, action: #selector(backButtonPress(sender:)), for: .touchUpInside)
    }
    
    @objc func backButtonPress(sender:UIButton!){
        let playView = PlayView()
        self.present(playView, animated: true, completion: nil)
    }
    
    
    
    //MARK: - Objects
    let timeLabel: UILabel = {
        let label = UILabel()
            label.text = "Time"
            label.font = UIFont(name: "AmericanTypewriter-Bold" , size: 80)
            label.textColor = UIColor.red
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
//            label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let buttonTopLeft: UIButton = {
        let button = UIButton()
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
            button.setTitle("Red", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 50)
            button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    let buttonTopRight: UIButton = {
        let button = UIButton()
            button.setTitle("Blue", for: .normal)
            button.setTitleColor(UIColor.blue, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 50)

        return button
    }()
    
    let buttonBottomLeft: UIButton = {
        let button = UIButton()
            button.setTitle("Pink", for: .normal)
            button.setTitleColor(UIColor.purple, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 50)
        
        return button
    }()
    
    let buttonBottomRight: UIButton = {
        let button = UIButton()
            button.setTitle("Purple", for: .normal)
            button.setTitleColor(UIColor.yellow, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 50)
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
            button.setTitle("Back", for: .normal)
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 30)
//            button.backgroundColor = UIColor.black
        
        return button
    }()
    
    //MARK: - Set Up Views
    func setUpViews() {
        view.backgroundColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        
        view.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width).isActive = true
        
        view.addSubview(buttonTopLeft)
        buttonTopLeft.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        buttonTopLeft.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonTopLeft.widthAnchor.constraint(equalToConstant: 170).isActive = true
        buttonTopLeft.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        
        view.addSubview(buttonTopRight)
        buttonTopRight.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        buttonTopRight.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonTopRight.widthAnchor.constraint(equalToConstant: 170).isActive = true
        buttonTopRight.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        
        view.addSubview(buttonBottomLeft)
        buttonBottomLeft.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        buttonBottomLeft.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonBottomLeft.widthAnchor.constraint(equalToConstant: 170).isActive = true
        buttonBottomLeft.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        
        view.addSubview(buttonBottomRight)
        buttonBottomRight.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        buttonBottomRight.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonBottomRight.widthAnchor.constraint(equalToConstant: 170).isActive = true
        buttonBottomRight.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true

    }
    
}
