//
//  EditColourViewController.swift
//  PictionaryGame
//
//  Created by Vanessa Bergen on 2020-07-21.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import UIKit

protocol AddCustomColour {
    func addColour(colour: CustomColour)
}

class EditColourViewController: UIViewController {
    
    var delegate: AddCustomColour?
    
    var brushSlider = UISlider()
    var brushLabel = UILabel()
    var brushValue = UILabel()
    
    var opacitySlider = UISlider()
    var opacityLabel = UILabel()
    var opacityValue = UILabel()
    
    var redSlider = UISlider()
    var redLabel = UILabel()
    var redValue = UILabel()
    
    var greenSlider = UISlider()
    var greenLabel = UILabel()
    var greenValue = UILabel()
    
    var blueSlider = UISlider()
    var blueLabel = UILabel()
    var blueValue = UILabel()
    
    var color = UIColor()
    var brushWidth: CGFloat = 0.0
    var opacity = CGFloat()
    var rgbRed = CGFloat()
    var rgbGreen = CGFloat()
    var rgbBlue = CGFloat()
    
    var previewImg = UIImageView()
    var previewLabel = UILabel()
    var fromPoint = CGPoint()
    var toPoint = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let margins = view.layoutMarginsGuide

        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelColour))
        let save = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveColour))
        
        navigationItem.leftBarButtonItem = cancel
        navigationItem.rightBarButtonItem = save
        
        brushLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        brushLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brushLabel)
        brushLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        brushLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        brushLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        brushLabel.text = "Brush"
        brushLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        brushValue.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        brushValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brushValue)
        brushValue.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        brushValue.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        brushValue.heightAnchor.constraint(equalToConstant: 50).isActive = true
        brushValue.text = String(format: "%.1f", brushWidth)
        
        brushSlider.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        brushSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brushSlider)
        brushSlider.leadingAnchor.constraint(equalTo: brushLabel.trailingAnchor, constant: 10).isActive = true
        brushSlider.trailingAnchor.constraint(equalTo: brushValue.leadingAnchor, constant: -10).isActive = true
        brushSlider.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        brushSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        brushSlider.minimumValue = 0
        brushSlider.maximumValue = 20
        brushSlider.setValue(Float(brushWidth), animated: true)
        brushSlider.addTarget(self, action: #selector(brushChange(sender: )), for: .valueChanged)
        
        
        opacityLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        opacityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(opacityLabel)
        opacityLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        opacityLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 70).isActive = true
        opacityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        opacityLabel.text = "Opacity"
        opacityLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        opacityValue.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        opacityValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(opacityValue)
        opacityValue.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        opacityValue.topAnchor.constraint(equalTo: margins.topAnchor, constant: 70).isActive = true
        opacityValue.heightAnchor.constraint(equalToConstant: 50).isActive = true
        opacityValue.text = String(format: "%.1f", opacity)
        
        opacitySlider.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        opacitySlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(opacitySlider)
        opacitySlider.leadingAnchor.constraint(equalTo: opacityLabel.trailingAnchor, constant: 10).isActive = true
        opacitySlider.trailingAnchor.constraint(equalTo: opacityValue.leadingAnchor, constant: -10).isActive = true
        opacitySlider.topAnchor.constraint(equalTo: margins.topAnchor, constant: 70).isActive = true
        opacitySlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        opacitySlider.minimumValue = 0
        opacitySlider.maximumValue = 1
        opacitySlider.setValue(Float(opacity), animated: true)
        opacitySlider.addTarget(self, action: #selector(opacityChange(sender: )), for: .valueChanged)
        
        
        redLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redLabel)
        redLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        redLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 120).isActive = true
        redLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        redLabel.text = "Red"
        redLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        redValue.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        redValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redValue)
        redValue.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        redValue.topAnchor.constraint(equalTo: margins.topAnchor, constant: 120).isActive = true
        redValue.heightAnchor.constraint(equalToConstant: 50).isActive = true
        redValue.text = String(format: "%.0f", rgbRed * 255)
        
        redSlider.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redSlider)
        redSlider.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: 10).isActive = true
        redSlider.trailingAnchor.constraint(equalTo: redValue.leadingAnchor, constant: -10).isActive = true
        redSlider.topAnchor.constraint(equalTo: margins.topAnchor, constant: 120).isActive = true
        redSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.setValue(Float(rgbRed) * 255, animated: true)
        redSlider.addTarget(self, action: #selector(redChange(sender: )), for: .valueChanged)
        print(rgbRed)
        
        greenLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenLabel)
        greenLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        greenLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 170).isActive = true
        greenLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greenLabel.text = "Green"
        greenLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        greenValue.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        greenValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenValue)
        greenValue.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        greenValue.topAnchor.constraint(equalTo: margins.topAnchor, constant: 170).isActive = true
        greenValue.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greenValue.text = String(format: "%.0f", rgbGreen * 255)
        
        greenSlider.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenSlider)
        greenSlider.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor, constant: 10).isActive = true
        greenSlider.trailingAnchor.constraint(equalTo: greenValue.leadingAnchor, constant: -10).isActive = true
        greenSlider.topAnchor.constraint(equalTo: margins.topAnchor, constant: 170).isActive = true
        greenSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.setValue(Float(rgbGreen) * 255, animated: true)
        greenSlider.addTarget(self, action: #selector(greenChange(sender: )), for: .valueChanged)
        
        blueLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueLabel)
        blueLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        blueLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 220).isActive = true
        blueLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueLabel.text = "Blue"
        blueLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        blueValue.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        blueValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueValue)
        blueValue.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        blueValue.topAnchor.constraint(equalTo: margins.topAnchor, constant: 220).isActive = true
        blueValue.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueValue.text = String(format: "%.0f", rgbBlue * 255)
        
        blueSlider.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueSlider)
        blueSlider.leadingAnchor.constraint(equalTo: blueLabel.trailingAnchor, constant: 10).isActive = true
        blueSlider.trailingAnchor.constraint(equalTo: blueValue.leadingAnchor, constant: -10).isActive = true
        blueSlider.topAnchor.constraint(equalTo: margins.topAnchor, constant: 220).isActive = true
        blueSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.setValue(Float(rgbBlue) * 255, animated: true)
        blueSlider.addTarget(self, action: #selector(blueChange(sender: )), for: .valueChanged)
        
        //let co = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1.0)
        let co = UIColor.green
        let rgb = co.cgColor
        let rbgCo = rgb.components
        print(rbgCo)
        
        
        
        
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width
        let height = screenSize.height
        
        previewLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(previewLabel)
        previewLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        previewLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 300).isActive = true
        previewLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        previewLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        previewLabel.text = "Preview"
        previewLabel.font = UIFont.boldSystemFont(ofSize: 24)
        previewLabel.textAlignment = .center
        
        previewImg.frame = CGRect(x: 0, y: 0, width: width, height: height)
        print(previewImg.frame)
        view.addSubview(previewImg)
        
        fromPoint = CGPoint(x: width/2, y: 420)
        toPoint = CGPoint(x: width/2, y: 490)
        
        drawLine(from: fromPoint, to: toPoint)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func cancelColour() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveColour() {
        //let mainController = DrawViewController()
        
       // mainController.chosenColour9 = color
        print("in save")
        let chosenColour = CustomColour.init(colour: color, opacity: opacity, brush: brushWidth)
        print(color)
        delegate?.addColour(colour: chosenColour)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func brushChange(sender: UISlider!) {
        let value = round(sender.value)
        brushSlider.value = value
        brushWidth = CGFloat(value)
        brushValue.text = String(value)
        drawLine(from: fromPoint, to: toPoint)
    }
    
    @objc func opacityChange(sender: UISlider!) {
        //round to have one decimal place
        let value = (sender.value * 10).rounded()/10
        opacitySlider.value = value
        opacity = CGFloat(value)
        opacityValue.text = String(value)
        drawLine(from: fromPoint, to: toPoint)
    }
    
    @objc func redChange(sender: UISlider!) {
        let value = round(sender.value)
        redSlider.value = value
        rgbRed = CGFloat(value)
        redValue.text = String(format: "%.0f", value)
        color = UIColor(red: rgbRed/255, green: rgbGreen/255, blue: rgbBlue/255, alpha: 1.0)
        drawLine(from: fromPoint, to: toPoint)
    }
    
    @objc func greenChange(sender: UISlider!) {
        let value = round(sender.value)
        greenSlider.value = value
        rgbGreen = CGFloat(value)
        greenValue.text = String(format: "%.0f", value)
        color = UIColor(red: rgbRed/255, green: rgbGreen/255, blue: rgbBlue/255, alpha: 1.0)
        drawLine(from: fromPoint, to: toPoint)
    }
    
    @objc func blueChange(sender: UISlider!) {
        let value = round(sender.value)
        blueSlider.value = value
        rgbBlue = CGFloat(value)
        blueValue.text = String(format: "%.0f", value)
        color = UIColor(red: rgbRed/255, green: rgbGreen/255, blue: rgbBlue/255, alpha: 1.0)
        drawLine(from: fromPoint, to: toPoint)
    }
    
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        previewImg.image = nil
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        previewImg.image?.draw(in: view.bounds)
        
        //this will draw a line from the lastPoint to the current point
        //this will produce a series of straight lines, lines are short enough that it will look like a curve
        print(fromPoint)
        print(toPoint)
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
        previewImg.image = UIGraphicsGetImageFromCurrentImageContext()
        previewImg.alpha = opacity
        UIGraphicsEndImageContext()
    }
 

}

