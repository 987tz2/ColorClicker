//
//  GameOverScreen.swift
//  Color Clicker
//
//  Created by Adam Farago on 4/9/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

class GameOverScreen: UIViewController {

    var didPass = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

        timeUp.isHidden = true
        
        checker()
        
        retryButton.addTarget(self, action: #selector(retryClick(sender:)), for: .touchUpInside)
        quitButton.addTarget(self, action: #selector(quitClick(sender:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func checker() {
        quitButton.setTitle("Quit?", for: .normal)
        
        if (didPass == true){
            youPassedFailed.text = "You Passed!"
            retryButton.setTitle("Again?", for: .normal)
            
        } else {
            youPassedFailed.text = "You Failed!"
            retryButton.setTitle("Try Again?", for: .normal)
        }
    }
    
    @objc func retryClick(sender:UIButton!) {
        present(GameScreen(), animated: true, completion: nil)
    }
    
    @objc func quitClick(sender:UIButton!) {
        present(PlayView(), animated: true, completion: nil)
    }

//    youPassedFailed.text = "You passed!"
//    youPassedFailed.isHidden = false
//    quitButton.setTitle("Quit", for: .normal)
//    retryButton.setTitle("Again?", for: .normal)
//    youPassedFailed.text = "You missed?"
//    quitButton.setTitle("Quit?", for: .normal)
//    retryButton.setTitle("Try Again?", for: .normal)
//    youPassedFailed.isHidden = false
    
    let retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Default", for: .normal)
        button.setTitleColor(.black, for: UIControlState(rawValue: 0))
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 30)
        button.backgroundColor = .red
        
        return button
    }()
    
    let quitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Default", for: .normal)
        button.setTitleColor(.red, for: UIControlState(rawValue: 0))
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 30)
        button.backgroundColor = .black
        
        return button
    }()
    
    let youPassedFailed: UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.font = UIFont(name: "AvenirNext-Bold", size: 50)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
        
        return label
    }()
    
    
    let timeUp: UIButton = {
        let label = UIButton()
//        label.setTitle("Times Up", for: .normal)
        label.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 60)
        label.setTitleColor(.black, for: UIControlState(rawValue:0))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.titleLabel?.textAlignment = .center
//        label.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
        
        return label
    }()
    
    func setUpViews() {
    
    view.addSubview(timeUp)
    timeUp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    timeUp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    timeUp.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    timeUp.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    
    view.addSubview(youPassedFailed)
    youPassedFailed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50).isActive = true
    youPassedFailed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    youPassedFailed.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    youPassedFailed.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    
    view.addSubview(quitButton)
    quitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550).isActive = true
    quitButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    quitButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    quitButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    
    view.addSubview(retryButton)
    retryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450).isActive = true
    retryButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    retryButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    retryButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    
    }
    
}
