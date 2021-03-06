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
    
    
    var colorWords = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple, UIColor.yellow, UIColor.black, UIColor.orange, UIColor.white, UIColor.magenta]
    var colorTitles = ["red", "green", "blue", "purple", "yellow", "black", "orange", "white", "magenta"]
    var colorDictionary:[UIColor:String] = [UIColor.red:"red", UIColor.green:"green", UIColor.blue:"blue", UIColor.purple:"purple", UIColor.yellow:"yellow", UIColor.black:"black", UIColor.orange:"orange", UIColor.white:"white", UIColor.magenta:"magenta"]
    var levelSelected = UserDefaults().integer(forKey: "pLevel")
    var seconds = 15
    var timer = Timer()
    var isTimerRunning = false
    var numberRight = 0
    var randomTitle = 0
    var randomTitleText = 0
    
    ///MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        seconds = (seconds - levelSelected)
        timeLabel.text = "\(seconds)"
        setEndScreenStatus(enabled: true)

        setButtonStatus(enabled: false, buttonAlpha: 0.5)
        
        backButton.addTarget(self, action: #selector(backButtonPress(sender:)), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonPress(sender:)), for: .touchUpInside)
        
        buttonBottomRight.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        buttonBottomLeft.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        buttonTopLeft.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        buttonTopRight.addTarget(self, action: #selector(gameButtonPress(sender:)), for: .touchUpInside)
        
        
    }
    
    // MARK: - Button Functions
    @objc func backButtonPress(sender:UIButton!){
        self.present(PlayView(), animated: true, completion: nil)
        timer.invalidate()
    }
    @objc func startButtonPress(sender:UIButton!){
        
        timeLabel.textColor = randomizeColor()
        setButtonProperties()
        
        view.backgroundColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        sender.isHidden = true
        
        setButtonStatus(enabled: true, buttonAlpha: 1)
        runTimer()
    }
    @objc func quitPress(sender:UIButton!){
        self.present(PlayView(), animated: true, completion: nil)
        timer.invalidate()
    }
    @objc func retryPress(sender:UIButton!){
        
        timer.invalidate()
    }
    
    func setButtonHidden(hidden: Bool){
        buttonTopLeft.isHidden = hidden
        buttonTopRight.isHidden = hidden
        buttonBottomRight.isHidden = hidden
        buttonBottomLeft.isHidden = hidden
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
    func setEndScreenStatus(enabled: Bool){
    }
    
    func gameEnd(pass: Bool){
        var gameOverScreen: GameOverScreen = GameOverScreen()
        gameOverScreen.didPass = pass
        present(gameOverScreen, animated: true, completion: nil)
        
    }
    
    
    
    
    //MARK: - Timer Functions
    @objc func timeUpPress(sender:UIButton!){ self.present(PlayView(), animated: true, completion: nil) }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameScreen.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        
        if (seconds >= 1){
            
            seconds -= 1
            timeLabel.text = "\(seconds)"
            
//            setButtonProperties()
            
        } else if (seconds == 0) {
            
            view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
            
            setButtonStatus(enabled: false, buttonAlpha: 0.2)
            timer.invalidate()
        }
    }
    
    
    
    //MARK: - Random Algorithms
    
    func randomizeColor() -> UIColor {
        randomTitle = GKRandomSource.sharedRandom().nextInt(upperBound: colorWords.count)
        
        return colorWords[randomTitle]
    }
    func randomizeWords() -> String {
        randomTitleText = GKRandomSource.sharedRandom().nextInt(upperBound: colorTitles.count)
        
        return colorTitles[randomTitleText]
    }
    
    
    
    //MARK: - Game Functions
    
    func getTimerColor() -> UIColor {
        return timeLabel.textColor
    }
    
    func setButtonProperties() {
        colorWords = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple, UIColor.yellow, UIColor.black, UIColor.orange, UIColor.white, UIColor.magenta]
        colorTitles = ["red", "green", "blue", "purple", "yellow", "black", "orange", "white", "magenta"]
        var arrayOfButtons = [buttonBottomRight,buttonBottomLeft,buttonTopRight,buttonTopLeft]
        let randomLuckyNumber = GKRandomSource.sharedRandom().nextInt(upperBound: arrayOfButtons.count)
        let luckyButton = arrayOfButtons[randomLuckyNumber]
        
        luckyButton.setTitle(colorDictionary[getTimerColor()], for: .normal)
        colorTitles = colorTitles.filter{$0 != luckyButton.titleLabel?.text}
        
        
        arrayOfButtons[0].setTitleColor(randomizeColor(), for: UIControlState(rawValue: 0))
        colorWords.remove(at: randomTitle)
        arrayOfButtons[1].setTitleColor(randomizeColor(), for: UIControlState(rawValue: 0))
        colorWords.remove(at: randomTitle)
        arrayOfButtons[2].setTitleColor(randomizeColor(), for: UIControlState(rawValue: 0))
        colorWords.remove(at: randomTitle)
        arrayOfButtons[3].setTitleColor(randomizeColor(), for: UIControlState(rawValue: 0))
        
//        arrayOfButtons.map() { $0.setTitleColor(randomizeColor(), for: UIControlState(rawValue: 0))}
        
        arrayOfButtons.remove(at: randomLuckyNumber)
        
        arrayOfButtons[0].setTitle(randomizeWords(), for: .normal)
        colorTitles.remove(at: randomTitleText)
        arrayOfButtons[1].setTitle(randomizeWords(), for: .normal)
        colorTitles.remove(at: randomTitleText)
        arrayOfButtons[2].setTitle(randomizeWords(), for: .normal)
        colorTitles.remove(at: randomTitleText)
        
    }
    
    @objc func gameButtonPress(sender:UIButton) {
        if ((sender.titleLabel?.text)! == colorDictionary[getTimerColor()]){
            numberRight += 1
            timeLabel.textColor = randomizeColor()
            setButtonProperties()


            if (numberRight == 5){
                timer.invalidate()
                setButtonStatus(enabled: false, buttonAlpha: 0.5)
                setEndScreenStatus(enabled: false)
                setButtonHidden(hidden: true)
                backButton.isHidden = true
                gameEnd(pass: true)
            }
        }   else {
                timer.invalidate()
                setButtonStatus(enabled: false, buttonAlpha: 0.5)
                setEndScreenStatus(enabled: false)
                setButtonHidden(hidden: true)
                backButton.isHidden = true
                gameEnd(pass: false)
        }
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
    
    let buttonTopLeft: UIButton = {
        let button = UIButton()
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
            button.setTitle("red", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.numberOfLines = -1
        
        return button
    }()
    
    let buttonTopRight: UIButton = {
        let button = UIButton()
            button.setTitle("blue", for: .normal)
            button.setTitleColor(UIColor.blue, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.titleLabel?.numberOfLines = -1
        
        return button
    }()
    
    let buttonBottomLeft: UIButton = {
        let button = UIButton()
            button.setTitle("green", for: .normal)
            button.setTitleColor(UIColor.green, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.titleLabel?.numberOfLines = -1
        
        return button
    }()
    
    let buttonBottomRight: UIButton = {
        let button = UIButton()
            button.setTitle("purple", for: .normal)
            button.setTitleColor(UIColor.purple, for: UIControlState(rawValue: 0))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 40)
            button.titleLabel?.numberOfLines = -1
        
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
