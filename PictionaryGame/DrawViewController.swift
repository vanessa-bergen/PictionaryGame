//
//  DrawViewController.swift
//  PictionaryGame
//
//  Created by Vanessa Bergen on 2020-07-21.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    var word = String()
    var wordList = [String]()
    //this holds the "drawing so far"
    var mainImageView = UIImageView()
    //this holds the "line you are currently drawing"
    var tempImageView = UIImageView()
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    //swipe indicates if brush stroke is continuous
    var swiped = false
    
    var mainColour = UILabel()
    
    var colour1 = UIButton()
    var colour2 = UIButton()
    var colour3 = UIButton()
    var colour4 = UIButton()
    var colour5 = UIButton()
    var colour6 = UIButton()
    var colour7 = UIButton()
    var colour8 = UIButton()
    var colour9 = UIButton()
    var colour10 = UIButton()
    var colour11 = UIButton()
    var colour12 = UIButton()
    var eraser = UIButton()
    var editColour = UIButton()
    
    var chosenColour9 = UIColor.white
    var chosenColour10 = UIColor.white
    var chosenColour11 = UIColor.white
    var chosenColour12 = UIColor.white
    var customCount: Int = 0
    
    var gameTimer = Timer()
    var gameTimerLabel = UILabel()
    let lightGray = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0)
    var minutes = 2
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let margins = self.view.layoutMarginsGuide
        
        let reset = UIBarButtonItem(title: "Clear Drawing", style: .plain, target: self, action: #selector(resetDrawing))
        let newGame = UIBarButtonItem(title: "New Game", style: .plain, target: self, action: #selector(newWord))
        
        navigationItem.leftBarButtonItem = reset
        navigationItem.rightBarButtonItem = newGame
        
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width
        let height = screenSize.height
        
        mainImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.addSubview(mainImageView)
        tempImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.addSubview(tempImageView)
        
        mainColour.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        mainColour.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainColour)
        mainColour.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        mainColour.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        mainColour.widthAnchor.constraint(equalToConstant: 50).isActive = true
        mainColour.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mainColour.backgroundColor = UIColor.black
        mainColour.layer.borderWidth = 1
        mainColour.layer.borderColor = UIColor.black.cgColor
        
        //colours on top row
        colour1.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour1)
        colour1.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        colour1.leadingAnchor.constraint(equalTo: mainColour.trailingAnchor, constant: 5).isActive = true
        colour1.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour1.backgroundColor = UIColor.black
        colour1.tag = 1
        colour1.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour1.layer.borderWidth = 1
        colour1.layer.borderColor = UIColor.black.cgColor
        
        colour2.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour2)
        colour2.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        colour2.leadingAnchor.constraint(equalTo: colour1.trailingAnchor, constant: 3).isActive = true
        colour2.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour2.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour2.backgroundColor = UIColor.red
        colour2.tag = 2
        colour2.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour2.layer.borderWidth = 1
        colour2.layer.borderColor = UIColor.black.cgColor
        
        colour3.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour3)
        colour3.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        colour3.leadingAnchor.constraint(equalTo: colour2.trailingAnchor, constant: 3).isActive = true
        colour3.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour3.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour3.backgroundColor = UIColor.orange
        colour3.tag = 3
        colour3.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour3.layer.borderWidth = 1
        colour3.layer.borderColor = UIColor.black.cgColor
        
        colour4.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour4)
        colour4.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        colour4.leadingAnchor.constraint(equalTo: colour3.trailingAnchor, constant: 3).isActive = true
        colour4.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour4.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour4.backgroundColor = UIColor.yellow
        colour4.tag = 4
        colour4.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour4.layer.borderWidth = 1
        colour4.layer.borderColor = UIColor.black.cgColor
        
        colour5.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour5)
        colour5.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        colour5.leadingAnchor.constraint(equalTo: colour4.trailingAnchor, constant: 3).isActive = true
        colour5.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour5.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour5.backgroundColor = UIColor.green
        colour5.tag = 5
        colour5.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour5.layer.borderWidth = 1
        colour5.layer.borderColor = UIColor.black.cgColor
        
        colour6.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour6.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour6)
        //colour6.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour6.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        colour6.leadingAnchor.constraint(equalTo: colour5.trailingAnchor, constant: 3).isActive = true
        colour6.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour6.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour6.backgroundColor = UIColor.blue
        colour6.tag = 6
        colour6.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour6.layer.borderWidth = 1
        colour6.layer.borderColor = UIColor.black.cgColor
        
        //colours on bottom row
        colour7.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour7.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour7)
        colour7.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour7.leadingAnchor.constraint(equalTo: mainColour.trailingAnchor, constant: 5).isActive = true
        colour7.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour7.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour7.backgroundColor = UIColor.purple
        colour7.tag = 7
        colour7.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour7.layer.borderWidth = 1
        colour7.layer.borderColor = UIColor.black.cgColor
        
        colour8.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour8.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour8)
        colour8.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour8.leadingAnchor.constraint(equalTo: colour7.trailingAnchor, constant: 3).isActive = true
        colour8.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour8.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour8.backgroundColor = Colour(tag: 8)?.colour
        colour8.tag = 8
        colour8.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour8.layer.borderWidth = 1
        colour8.layer.borderColor = UIColor.black.cgColor
        
        colour9.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour9.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour9)
        colour9.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour9.leadingAnchor.constraint(equalTo: colour8.trailingAnchor, constant: 3).isActive = true
        colour9.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour9.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour9.backgroundColor = UIColor.white
        colour9.tag = 10
        colour9.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour9.layer.borderWidth = 1
        colour9.layer.borderColor = UIColor.black.cgColor
        
        colour10.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour10.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour10)
        colour10.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour10.leadingAnchor.constraint(equalTo: colour9.trailingAnchor, constant: 3).isActive = true
        colour10.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour10.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour10.backgroundColor = UIColor.white
        colour10.tag = 11
        colour10.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour10.layer.borderWidth = 1
        colour10.layer.borderColor = UIColor.black.cgColor
        
        colour11.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour11.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour11)
        colour11.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour11.leadingAnchor.constraint(equalTo: colour10.trailingAnchor, constant: 3).isActive = true
        colour11.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour11.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour11.backgroundColor = UIColor.white
        colour11.tag = 12
        colour11.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour11.layer.borderWidth = 1
        colour11.layer.borderColor = UIColor.black.cgColor
        
        colour12.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        colour12.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colour12)
        colour12.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        colour12.leadingAnchor.constraint(equalTo: colour11.trailingAnchor, constant: 3).isActive = true
        colour12.widthAnchor.constraint(equalToConstant: 24).isActive = true
        colour12.heightAnchor.constraint(equalToConstant: 24).isActive = true
        colour12.backgroundColor = UIColor.white
        colour12.tag = 13
        colour12.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        colour12.layer.borderWidth = 1
        colour12.layer.borderColor = UIColor.black.cgColor
        
        eraser.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        eraser.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eraser)
        //eraser.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        eraser.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        eraser.leadingAnchor.constraint(equalTo: colour6.trailingAnchor, constant: 5).isActive = true
        eraser.widthAnchor.constraint(equalToConstant: 55/2).isActive = true
        eraser.heightAnchor.constraint(equalToConstant: 167/3).isActive = true
        eraser.setImage(UIImage(named: "Eraser"), for: .normal)
        eraser.tag = 9
        eraser.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        
        editColour.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        editColour.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editColour)
        //eraser.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        editColour.topAnchor.constraint(equalTo: mainColour.topAnchor).isActive = true
        editColour.leadingAnchor.constraint(equalTo: eraser.trailingAnchor).isActive = true
        editColour.widthAnchor.constraint(equalToConstant: 50).isActive = true
        editColour.heightAnchor.constraint(equalToConstant: 50).isActive = true
        editColour.setImage(UIImage(named: "ColourPalette"), for: .normal)
        //eraser.tag = 9
        //eraser.addTarget(self, action: #selector(changeColour(sender:)), for: .touchUpInside)
        editColour.addTarget(self, action: #selector(editScreen), for: .touchUpInside)

        gameTimerLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        gameTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameTimerLabel)
        gameTimerLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        gameTimerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        gameTimerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        gameTimerLabel.heightAnchor.constraint(equalToConstant: 400)
        gameTimerLabel.textAlignment = .center
        gameTimerLabel.text = "2:00"
        //this is added so that the label width stays the same regardless of the number
        gameTimerLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 42.0, weight: UIFont.Weight.medium)
        gameTimerLabel.textColor = UIColor.white
        gameTimerLabel.backgroundColor = lightGray
        
    }
    
    //touches began is called when the user puts a finger down on the screen
    //reset swiped to false since the touch hasn't moved yet
    //save the location of the touch as the last point
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: view)
    }
    
    //method resposible for drawing a line between two points
    //here we want to draw into the tempImageView which holds the current line
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        tempImageView.image?.draw(in: view.bounds)
        
        //this will draw a line from the lastPoint to the current point
        //this will produce a series of straight lines, lines are short enough that it will look like a curve
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        //setting drawing parameters
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        
        //this is where you actually draw the path
        context.strokePath()
        
        //wrap up the drawing context to render the new line into the temp image view
        //you get the image representation of the context and set it to the image property of tempImageView
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    //this method is called when the user drags a finger along the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        //set swiped to true so that you can keep track if the current swipe is in progress
        swiped = true
        
        //get the current point
        let currentPoint = touch.location(in: view)
        //call the draw mathod to draw line from last point to current point
        drawLine(from: lastPoint, to: currentPoint)
        //update the last point so the next touch event will continue where you left off
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            //draw a single point
            drawLine(from: lastPoint, to: lastPoint)
        }
        
        //merge the temp image view into main image view
        //there are two image views becuase of the opacity
        //when you are drawing on tempImageView the opacity is set to 1.0
        //when you merge them, you can set the tempImageView opacity to the configured value
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        tempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        tempImageView.image = nil
    }
    
    @objc func resetDrawing() {
        mainImageView.image = nil
    }
    
    @objc func newWord() {
        mainImageView.image = nil
        minutes = 2
        seconds = 0
        setGameTimerLabel(minutes: minutes, seconds: seconds)
        
        if wordList.count <= 0 {
            generateWordList()
        }
        
        let numOfElements = wordList.count
        let randomInt = Int.random(in: 0...(numOfElements - 1))
        let randomWord = wordList[randomInt]
        
        self.word = randomWord
        
        wordList.remove(at: randomInt)
        
        let newWordPopup = PopupViewController()
        newWordPopup.word = self.word
        newWordPopup.providesPresentationContextTransitionStyle = true
        newWordPopup.definesPresentationContext = true
        newWordPopup.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        newWordPopup.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        newWordPopup.delegate = self
        self.present(newWordPopup, animated: true, completion: nil)
    }
    
    func generateWordList() {
        if let wordsFilePath = Bundle.main.path(forResource: "pictionarywords", ofType: nil) {
            do {
                let wordsString = try String(contentsOfFile: wordsFilePath)
                
                self.wordList = wordsString.components(separatedBy: .newlines)
                
                //remove the last element which is an empty line for some reason
                let count = wordList.count
                wordList.remove(at: count-1)
                
            } catch { // contentsOfFile throws an error
                print("Error: \(error)")
            }
        }
        else {
            print("failed trying to generate word list")
        }

    }
    
    @objc func changeColour(sender: UIButton!) {
        let tagNo: Int = sender.tag
        
        if tagNo <= 9 {
            guard let chosenColour = Colour(tag: tagNo) else {
                return
            }
            //get the colour from the enum
            color = chosenColour.colour
        }
        
        else {
            switch tagNo {
            case 10:
                color = chosenColour9
            case 11:
                color = chosenColour10
            case 12:
                color = chosenColour11
            case 13:
                color = chosenColour12
            default:
                color = UIColor.white
            }
            
        }
        
        
        mainColour.backgroundColor = color
    }
    
    @objc func editScreen() {
        var rgbRed: CGFloat
        var rgbGreen: CGFloat
        var rgbBlue: CGFloat
        
        if color == .black {
            rgbRed = 0
            rgbGreen = 0
            rgbBlue = 0
        }
        else {
            let currentColour = self.color.cgColor
            let rgb = currentColour.components
            rgbRed = rgb?[0] ?? 0
            rgbGreen = rgb?[1] ?? 0
            rgbBlue = rgb?[2] ?? 0
        }
        
        let controller = EditColourViewController()
        controller.delegate = self
        
        controller.brushWidth = self.brushWidth
        controller.opacity = self.opacity
        controller.rgbRed = rgbRed
        controller.rgbGreen = rgbGreen
        controller.rgbBlue = rgbBlue
        controller.color = color
        
        self.navigationController?.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    @objc func startGameTimer() {
        if seconds == 0 && minutes == 0 {
            gameTimer.invalidate()
        }
        else if seconds == 0 && minutes != 0 {
            seconds = 59
            minutes -= 1
        }
        else {
            seconds -= 1
        }
        
        setGameTimerLabel(minutes: minutes, seconds: seconds)
        
        
    }
    
    func setGameTimerLabel(minutes: Int, seconds: Int) {
        if minutes == 0 && seconds <= 10 && seconds != 0 {
            gameTimerLabel.text = String(format: "%d", seconds)
            gameTimerLabel.textColor = UIColor.red
        }
        else if seconds == 0 && minutes == 0 {
            gameTimerLabel.text = "Game Over"
            gameTimerLabel.textColor = UIColor.white
        }
        else {
            gameTimerLabel.textColor = UIColor.white
            gameTimerLabel.text = String(format: "%d:%02d", minutes, seconds)
        }
    }


}


extension DrawViewController: AddCustomColour {
    func addColour(colour: CustomColour) {
        if customCount < 4 {
            customCount += 1
        }
        else {
            customCount = 1
        }
        let customColour = colour.colour
        let customOpacity = colour.opacity
        let customWidth = colour.brush
        self.opacity = customOpacity
        self.brushWidth = customWidth
        switch customCount {
        case 1:
            colour9.backgroundColor = customColour
            self.color = customColour
            mainColour.backgroundColor = customColour
            chosenColour9 = customColour
        case 2:
            colour10.backgroundColor = customColour
            self.color = customColour
            mainColour.backgroundColor = customColour
            chosenColour10 = customColour
        case 3:
            colour11.backgroundColor = customColour
            self.color = customColour
            mainColour.backgroundColor = customColour
            chosenColour11 = customColour
        case 4:
            colour12.backgroundColor = customColour
            self.color = customColour
            mainColour.backgroundColor = customColour
            chosenColour12 = customColour
        default:
            colour9.backgroundColor = nil
            colour10.backgroundColor = nil
            colour11.backgroundColor = nil
            colour12.backgroundColor = nil
            
        }
    }
}

extension DrawViewController: ClosePopup {
    func startGame() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startGameTimer), userInfo: nil, repeats: true)
    }
}


