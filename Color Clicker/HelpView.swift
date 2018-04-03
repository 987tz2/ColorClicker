//
//  HelpView.swift
//  Color Clicker
//
//  Created by Adam Farago on 3/26/18.
//  Copyright © 2018 Adam Farago. All rights reserved.
//

import UIKit

class HelpView: UIViewController {

    
    //Mark: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        backButton.addTarget(self, action: #selector(backButtonPress(sender:)), for: .touchUpInside)
    }
    
    @objc func backButtonPress(sender:UIButton!) {
        let viewController = ViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    //Mark: - Objects
    
    let helpIcon: UILabel = {
        let label = UILabel()
            label.text = "Help"
            label.font = UIFont(name: "AvenirNext-Bold", size: 80)
            label.textColor = UIColor.orange
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
        
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
            button.setTitle("Back", for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 40)
            button.setTitleColor(UIColor.red, for: UIControlState(rawValue:0))
            button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let randomNumber = arc4random()
    
    //Mark: - Set up views
    
    func setUpViews(){
        
        view.backgroundColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        
        view.addSubview(helpIcon)
        helpIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        helpIcon.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        helpIcon.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        
        view.addSubview(backButton)
        backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    }
    
}
