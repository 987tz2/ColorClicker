//
//  counterTest.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/26/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit
import GameKit

class GameScreen: UIViewController {

    //MARK: - Variables
    
    
    var colorWords = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple, UIColor.yellow, UIColor.black, UIColor.brown, UIColor.orange, UIColor.white, UIColor.magenta]
    var colorTitles = ["red", "green", "blue", "purple", "yellow", "black", "brown", "orange", "white", "magenta"]
    var colorDictionary:[UIColor:String] = [UIColor.red:"red", UIColor.green:"green", UIColor.blue:"blue", UIColor.purple:"purple", UIColor.yellow:"yellow", UIColor.black:"black", UIColor.brown:"brown", UIColor.orange:"orange", UIColor.white:"white", UIColor.magenta:"magenta"]
    var levelSelected = 0
    var seconds = 50
    var timer = Timer()
    var isTimerRunning = false
    var timeLabelColor = UIColor.red
    
    ///MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        seconds = (seconds - levelSelected)
        timeLabel.text = "\(seconds)"
        timeUp.isHidden = true
        
        setButtonStatus(enabled: false, buttonAlpha: 0.5)
        
        backButton.addTarget(self, action: #selector(backButtonPress(sender:)), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonPress(sender:)), for: .touchUpInside)
        timeUp.addTarget(self, action: #selector(timeUpPress(sender:)), for: .touchUpInside)
        
        buttonBottomRight.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        buttonBottomLeft.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        buttonTopLeft.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        buttonTopRight.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        timeLabel.textColor = randomizeColor()
        timeLabelColor = timeReturnColor(label: timeLabel)
        setButtonColors(button1: buttonTopRight, button2: buttonTopLeft, button3: buttonBottomLeft, button4: buttonBottomRight)
    }
    @objc func gameButtonPress(sender:UIButton!) {
        
        if ((sender.titleLabel?.text)! == colorDictionary[timeLabelColor]!){
            timeLabel.textColor = randomizeColor()
            setButtonColors(button1: buttonTopRight, button2: buttonTopLeft, button3: buttonBottomLeft, button4: buttonBottomRight)
            
        } else { }
        
        print("buttonPressed before: \(colorDictionary[timeLabelColor]!)")
        timeLabelColor = timeReturnColor(label: timeLabel)
        print("buttonPressed after: \(colorDictionary[timeLabelColor]!)")
        
    }
    @objc func backButtonPress(sender:UIButton!){
        self.present(PlayView(), animated: true, completion: nil)
        timer.invalidate()
    }
    @objc func startButtonPress(sender:UIButton!){
        
        view.backgroundColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        sender.isHidden = true
        
        setButtonStatus(enabled: true, buttonAlpha: 1)
        runTimer()
    }
    @objc func timeUpPress(sender:UIButton!){
        self.present(PlayView(), animated: true, completion: nil)
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameScreen.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if (seconds >= 1){
            
            seconds -= 1
            timeLabel.text = "\(seconds)"
            print("updateTimer: \(colorDictionary[timeLabelColor]!)")
            
        } else if (seconds == 0) {
            
            view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
            timeUp.isHidden = false
            
            timer.invalidate()
            setButtonStatus(enabled: false, buttonAlpha: 0.2)
        }
    }
    func timeReturnColor (label:UILabel) -> UIColor {
        guard let color = label.textColor else {fatalError("Something went wrong")}
        return color
    }
    func setButtonColors(button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton){
        
        var buttonArray = [button1, button2, button3, button4]
        let randomButton = GKRandomSource.sharedRandom().nextInt(upperBound: buttonArray.count)

        let luckyNumber = buttonArray[randomButton]
        luckyNumber.setTitle(colorDictionary[timeLabelColor], for: .normal)

        buttonArray.remove(at: randomButton)

        buttonArray[0].titleLabel?.textColor = randomizeColor()
        buttonArray[1].titleLabel?.textColor = randomizeColor()
        buttonArray[2].titleLabel?.textColor = randomizeColor()


        buttonArray[0].setTitle(randomizeWords(), for: .normal)
        buttonArray[1].setTitle(randomizeWords(), for: .normal)
        buttonArray[2].setTitle(randomizeWords(), for: .normal)
        
        
    }
    
    func setButtonStatus(enabled: Bool, buttonAlpha: CGFloat){
        
        buttonTopLeft.alpha = buttonAlpha
        buttonTopRight.alpha = buttonAlpha
        buttonBottomLeft.alpha = buttonAlpha
        buttonBottomRight.alpha = buttonAlpha
        
        buttonTopLeft.isEnabled = enabled
        buttonTopRight.isEnabled = enabled
        buttonBottomRight.isEnabled = enabled
        buttonBottomLeft.isEnabled = enabled
        
    }
    //MARK: - Random Algorithms
    
    func randomizeColor() -> UIColor {
        let randomTitle = GKRandomSource.sharedRandom().nextInt(upperBound: colorWords.count)
        
        return colorWords[randomTitle]
    }
    
    func randomizeWords() -> String {
        let randomTitle = GKRandomSource.sharedRandom().nextInt(upperBound: colorTitles.count)
        
        return colorTitles[randomTitle]
    }
    
    //MARK: - Objectes
    
    let backButton: UIButton = {
        let button = UIButton()
            button.setTitle("Back", for: .normal)
            button.setTitleColor(UIColor.black, for: UIControlState(rawValue:0))
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
            button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
            button.setTitle("Start", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 50)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .black
        
        return button
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
            label.font = UIFont(name: "AvenirNext-Bold", size: 80)
            label.text = "seconds"
            label.textColor = UIColor.purple
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
        
        return label
    }()
    
    let timeUp: UIButton = {
        let label = UIButton()
            label.setTitle("Times Up", for: .normal)
            label.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 60)
            label.setTitleColor(.black, for: UIControlState(rawValue:0))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.titleLabel?.textAlignment = .center
            label.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
        
        return label
    }()
    
    let buttonTopLeft: UIButton = {
        let button = UIButton()
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
            button.setTitle("red", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.numberOfLines = -1
            button.backgroundColor = .yellow
        
        return button
    }()
    
    let buttonTopRight: UIButton = {
        let button = UIButton()
            button.setTitle("blue", for: .normal)
            button.setTitleColor(UIColor.blue, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.titleLabel?.numberOfLines = -1
            button.backgroundColor = .green
        
        return button
    }()
    
    let buttonBottomLeft: UIButton = {
        let button = UIButton()
            button.setTitle("green", for: .normal)
            button.setTitleColor(UIColor.green, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.titleLabel?.numberOfLines = -1
            button.backgroundColor = .black
        
        return button
    }()
    
    let buttonBottomRight: UIButton = {
        let button = UIButton()
            button.setTitle("purple", for: .normal)
            button.setTitleColor(UIColor.purple, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.titleLabel?.numberOfLines = -1
            button.backgroundColor = .red
        
        return button
    }()
    
    //MARK: - Set up views
   
    func setUpViews(){
        view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
        
        
        view.addSubview(backButton)
        backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(startButton)
        startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350).isActive = true
        startButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        startButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        
        view.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(timeUp)
        timeUp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        timeUp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        timeUp.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        timeUp.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        
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
    }
}

//red, green, blue, purple, yellow, black, brown, oragne, white, magenta
