//
//  ViewController.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/12/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let playButtonWidth: CGFloat = 300
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        playButton.addTarget(self, action: #selector(buttonGrowth(sender:)), for: .touchUpInside)
        helpButton.addTarget(self, action: #selector(buttonGrowth2(sender:)), for: .touchUpInside)
        randomNumber.addTarget(self, action: #selector(randomNumberPress(sender:)), for: .touchUpInside)
        counterTestButton.addTarget(self, action: #selector(counterTestPress(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonGrowth(sender:UIButton!){
        
        self.playButton.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        UIView.animate(withDuration: 0.2 , delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .allowUserInteraction, animations: {
            self.playButton.transform = .identity
        }, completion: nil)
        
        let playView = PlayView()
        self.present(playView, animated: true, completion: nil)
    }
    
    @objc func buttonGrowth2(sender:UIButton!){
        
        helpButton.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        UIView.animate(withDuration: 0.2 , delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .allowUserInteraction, animations: {
            self.helpButton.transform = .identity
        }, completion: nil)
        
        let helpView = HelpView()
        self.present(helpView, animated: true, completion: nil)
    }
    
    @objc func randomNumberPress(sender:UIButton!){
        let randomNumberN = Int(arc4random_uniform(6))
        let myString = String(randomNumberN)
        randomNumber.setTitle(myString, for: .normal)
    }
    
    @objc func counterTestPress(sender:UIButton!){
        let CounterTest = GameScreen()
        self.present(CounterTest, animated: true, completion: nil)
    }
    
    //MARK: - Objectes
    let playButton: UIButton = {
        let button = UIButton()
            button.setTitle("Play", for: .normal)
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
        
        return button
    } ()
    let helpButton: UIButton = {
        let button = UIButton()
            button.setTitle("Help", for: .normal)
            button.setTitleColor(UIColor.orange, for: UIControlState(rawValue: 0))
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
        
        return button
    } ()
    let dabIcon: UILabel = {
        let button = UILabel()
            button.text = "Color Clicker"
            button.textColor = UIColor.black
            button.font = UIFont(name: "AvenirNext-Bold", size: 65)
            button.textAlignment = .center
            button.translatesAutoresizingMaskIntoConstraints = false
//            button.backgroundColor = .blue
//            button.adjustsFontSizeToFitWidth = true
//            button.minimumScaleFactor = 0.2
            button.numberOfLines = 2
        
        return button
    } ()

    let randomNumber : UIButton = {
        let button = UIButton()
            button.setTitleColor(UIColor.yellow, for: UIControlState(rawValue:0))
            button.setTitle("Number", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
            button.translatesAutoresizingMaskIntoConstraints = false
//            button.backgroundColor = UIColor.black
            button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let counterTestButton: UIButton = {
        let button = UIButton()
            button.setTitle("Go", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
            button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    //MARK: - Set Up Views
    func setupViews(){
        view.backgroundColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        
        view.addSubview(playButton)
        playButton.frame = CGRect(x: (view.frame.width - 300 ) / 2 , y: view.frame.height*(2/3), width: playButtonWidth, height: CGFloat(100))
        
        view.addSubview(helpButton)
        helpButton.frame = CGRect(x: (view.frame.width - playButtonWidth) / 2, y: (view.frame.width - 50)*1.6, width: playButtonWidth, height: CGFloat(50))
        
        view.addSubview(dabIcon)
        dabIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        dabIcon.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        dabIcon.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        dabIcon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(randomNumber)
        randomNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        randomNumber.heightAnchor.constraint(equalToConstant: 100).isActive = true
        randomNumber.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        randomNumber.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        
        view.addSubview(counterTestButton)
        counterTestButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        counterTestButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        counterTestButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
