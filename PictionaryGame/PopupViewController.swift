//
//  PopupViewController.swift
//  PictionaryGame
//
//  Created by Vanessa Bergen on 2020-07-21.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import UIKit

protocol ClosePopup {
    func startGame()
}

class PopupViewController: UIViewController {
    
    var delegate: ClosePopup?
    
    var wordPopupView = UIView()
    var titleLabel = UILabel()
    var word = String()
    var wordLabel = UILabel()
    var startTimer = Timer()
    var startCountdown = 5
    var countdownLabel = UILabel()
    var width: CGFloat = 0

    
    // var delegate = CustomwordPopupViewDelegate?
    let backgroundGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        width = self.view.frame.width - 40
        wordPopupView.frame = CGRect(x: 20, y: 100, width: width, height: 200)
        self.view.addSubview(wordPopupView)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //this forces the layout of subviews before drawing
        view.layoutIfNeeded()
        
    }
    
    func setupView() {
        
        wordPopupView.backgroundColor = backgroundGrayColor
        wordPopupView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        titleLabel.frame = CGRect(x: 0, y: 30, width: width, height: 40)
        wordPopupView.addSubview(titleLabel)
        titleLabel.text = "Your Word Is: "
        titleLabel.textColor = UIColor.blue
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = backgroundGrayColor
        
        let width = wordPopupView.frame.width
        
        wordLabel.frame = CGRect(x: 0, y: 60, width: width, height: 50)
        wordPopupView.addSubview(wordLabel)
        wordLabel.text = self.word.uppercased()
        wordLabel.textAlignment = .center
        wordLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        countdownLabel.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        wordPopupView.addSubview(countdownLabel)
        countdownLabel.text = "Game Starts In: 5"
        countdownLabel.textColor = UIColor.red
        countdownLabel.textAlignment = .center
        countdownLabel.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.countdownLabel.alpha = 1.0
            self.countdownLabel.frame.origin.y += 150
            }
        )
        
        
        startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    func animateView() {
        wordPopupView.alpha = 0;
        self.wordPopupView.frame.origin.y = self.wordPopupView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.wordPopupView.alpha = 1.0;
            self.wordPopupView.frame.origin.y -= 50
        })
    }
    
    @objc func updateTimer() {
        startCountdown -= 1
        countdownLabel.text = "Game Starts In: \(startCountdown)"
        
        if startCountdown == 0 {
            startTimer.invalidate()
            self.dismiss(animated: true, completion: delegate?.startGame)
            
        }
    }
    
   
    

}
